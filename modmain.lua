local _G = GLOBAL
local Text = require "widgets/text"

-- keep user-facing runtime text in stable STRINGS keys so translation mods
-- can override it without modifying this mod.
_G.STRINGS.STATUSVARSLER = _G.STRINGS.STATUSVARSLER or {}
local status_strings = _G.STRINGS.STATUSVARSLER

local load_status_alert_lines = require "status_alert_lines"
load_status_alert_lines(status_strings)
local colors = {
    red = { 1.00, 0.15, 0.15 },
    dark_red = { 0.60, 0.05, 0.05 },
    orange = { 1.00, 0.50, 0.10 },
    yellow = { 1.00, 0.90, 0.10 },
    green = { 0.20, 1.00, 0.20 },
    cyan = { 0.00, 1.00, 1.00 },
    blue = { 0.20, 0.45, 1.00 },
    purple = { 0.75, 0.30, 1.00 },
    pink = { 1.00, 0.40, 0.70 },
    white = { 1.00, 1.00, 1.00 },
}

local settings = {
    hunger = {
        enabled = GetModConfigData("show_hunger"),
        threshold = GetModConfigData("hunger_threshold"),
        color = GetModConfigData("hunger_color"),
        priority = 1,
    },
    sanity = {
        enabled = GetModConfigData("show_sanity"),
        threshold = GetModConfigData("sanity_threshold"),
        color = GetModConfigData("sanity_color"),
        priority = 1,
    },
    health = {
        enabled = GetModConfigData("show_health"),
        threshold = GetModConfigData("health_threshold"),
        color = GetModConfigData("health_color"),
        priority = 3,
    },
    temperature = {
        enabled = GetModConfigData("show_temperature"),
        cold_threshold = GetModConfigData("cold_threshold"),
        cold_color = GetModConfigData("cold_color"),
        heat_threshold = GetModConfigData("heat_threshold"),
        heat_color = GetModConfigData("heat_color"),
    },
    alert_size = GetModConfigData("alert_size") or 1.5,
    alert_duration = GetModConfigData("alert_duration") or 6,
    reminder_interval = GetModConfigData("reminder_interval") or 240,
    alert_text = GetModConfigData("alert_text") or "immersive",
}

local triggered = {
    hunger = false,
    sanity = false,
    health = false,
    cold = false,
    heat = false,
}

local last_alert_time = {
    hunger = nil,
    sanity = nil,
    health = nil,
    cold = nil,
    heat = nil,
}

local last_immersive_index = {}
local current_alert
local current_alert_task
local current_alert_priority = 0

local function clear_alert()
    if current_alert_task then
        current_alert_task:Cancel()
        current_alert_task = nil
    end

    if current_alert then
        current_alert:Kill()
        current_alert = nil
    end

    current_alert_priority = 0
end

local function show_alert(player, message, color_name, priority)
    if not player.HUD then
        return false
    end

    if current_alert and priority <= current_alert_priority then
        return false
    end

    clear_alert()

    local text = player.HUD:AddChild(Text(_G.UIFONT, 40 * settings.alert_size))
    local color = colors[color_name] or colors.white

    text:SetString(message)
    text:SetColour(color[1], color[2], color[3], 1)
    text:SetHAnchor(_G.ANCHOR_MIDDLE)
    text:SetVAnchor(_G.ANCHOR_TOP)
    text:SetPosition(0, -120, 0)
    text:MoveToFront()

    current_alert = text
    current_alert_priority = priority

    current_alert_task = player:DoTaskInTime(settings.alert_duration, function()
        if current_alert == text then
            current_alert = nil
            current_alert_task = nil
            current_alert_priority = 0
        end

        text:Kill()
    end)

    return true
end

local function round(value)
    return math.floor(value + 0.5)
end

local function build_alert_message(player, condition, value)
    if settings.alert_text ~= "immersive" then
        return string.format(status_strings.VALUES[condition], value)
    end

    local prefab = player.prefab or "generic"
    local character = status_strings.IMMERSIVE[prefab]
        or status_strings.IMMERSIVE.generic
    local lines = character[condition]
        or status_strings.IMMERSIVE.generic[condition]

    local identity = prefab .. ":" .. condition
    local previous = last_immersive_index[identity]
    local index

    -- pick randomly while preventing the same shown line twice in a row.
    if previous == nil then
        index = math.random(1, #lines)
    else
        index = math.random(1, #lines - 1)
        if index >= previous then
            index = index + 1
        end
    end

    return lines[index], index, identity
end

local function get_stat_percent(player, stat_name)
    local replica = player.replica and player.replica[stat_name]
    if not replica then
        return nil
    end

    if replica.GetPercent then
        return replica:GetPercent()
    end

    if replica.GetCurrent and replica.GetMax then
        local maximum = replica:GetMax()
        if maximum and maximum > 0 then
            return replica:GetCurrent() / maximum
        end
    end

    return nil
end

local function check_stat(player, stat_name)
    local config = settings[stat_name]
    if not config.enabled then
        return
    end

    local percent = get_stat_percent(player, stat_name)
    if percent == nil then
        return
    end

    -- death needs no low-health warning, but reset the state for resurrection.
    if stat_name == "health" and percent <= 0 then
        triggered.health = false
        last_alert_time.health = nil
        return
    end

    if percent <= config.threshold then
        local now = _G.GetTime()
        local reminder_due =
            triggered[stat_name]
            and last_alert_time[stat_name] ~= nil
            and now - last_alert_time[stat_name] >= settings.reminder_interval

        if not triggered[stat_name] or reminder_due then
            local message, immersive_index, immersive_identity =
                build_alert_message(player, stat_name, round(percent * 100))

            if show_alert(player, message, config.color, config.priority) then
                triggered[stat_name] = true
                last_alert_time[stat_name] = now

                if immersive_index then
                    last_immersive_index[immersive_identity] = immersive_index
                end
            end
        end

        return
    end

    -- require a small recovery margin before a new threshold crossing can alert.
    local reset_threshold = math.min(1, config.threshold + 0.05)
    if triggered[stat_name] and percent >= reset_threshold then
        triggered[stat_name] = false
        last_alert_time[stat_name] = nil
    end
end

local function get_temperature(player)
    if player.GetTemperature then
        return player:GetTemperature()
    end

    local component = player.components and player.components.temperature
    return component and component.current or nil
end

local function check_temperature(player)
    local config = settings.temperature
    if not config.enabled then
        return
    end

    local temperature = get_temperature(player)
    if temperature == nil then
        return
    end

    if temperature <= config.cold_threshold then
        local now = _G.GetTime()
        local reminder_due =
            triggered.cold
            and last_alert_time.cold ~= nil
            and now - last_alert_time.cold >= settings.reminder_interval

        if not triggered.cold or reminder_due then
            local message, immersive_index, immersive_identity =
                build_alert_message(player, "cold", round(temperature))

            if show_alert(player, message, config.cold_color, 2) then
                triggered.cold = true
                last_alert_time.cold = now

                if immersive_index then
                    last_immersive_index[immersive_identity] = immersive_index
                end
            end
        end
    elseif triggered.cold and temperature >= config.cold_threshold + 5 then
        triggered.cold = false
        last_alert_time.cold = nil
    end

    if temperature >= config.heat_threshold then
        local now = _G.GetTime()
        local reminder_due =
            triggered.heat
            and last_alert_time.heat ~= nil
            and now - last_alert_time.heat >= settings.reminder_interval

        if not triggered.heat or reminder_due then
            local message, immersive_index, immersive_identity =
                build_alert_message(player, "heat", round(temperature))

            if show_alert(player, message, config.heat_color, 2) then
                triggered.heat = true
                last_alert_time.heat = now

                if immersive_index then
                    last_immersive_index[immersive_identity] = immersive_index
                end
            end
        end
    elseif triggered.heat and temperature <= config.heat_threshold - 5 then
        triggered.heat = false
        last_alert_time.heat = nil
    end
end
local function check_status(player)
    -- health may replace a less important alert already on screen.
    check_stat(player, "health")
    check_temperature(player)
    check_stat(player, "hunger")
    check_stat(player, "sanity")
end

local function start_monitoring(player)
    if player ~= _G.ThePlayer then
        return
    end

    player:DoPeriodicTask(1, function()
        check_status(player)
    end)
end

AddPlayerPostInit(function(player)
    -- ThePlayer may not be assigned yet when the player prefab is initialized.
    player:DoTaskInTime(0, function()
        start_monitoring(player)
    end)
end)
