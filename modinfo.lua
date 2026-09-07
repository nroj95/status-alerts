local english = {
    mod_name = "status alerts",
    mod_description = "vanilla-friendly status alerts for hunger, sanity, health, and temperature.\n\ndefaults favor immersive, low-clutter warnings. prefer more precision? switch alert text to values and adjust thresholds, alert duration, and reminders.",

    show = "Show",
    hide = "Hide",

    red = "Red",
    dark_red = "Dark red",
    orange = "Orange",
    yellow = "Yellow",
    green = "Green",
    cyan = "Cyan",
    blue = "Blue",
    purple = "Purple",
    pink = "Pink",
    white = "White",

    percentage_prefix = "",
    percentage_suffix = " %",
    duration_prefix = "",
    duration_suffix = " sec.",
    reminder_prefix = "",
    reminder_suffix = " min.",

    show_hunger = "Show hunger alert",
    hunger_threshold = "Hunger threshold",
    hunger_threshold_hover = "Alerts when hunger reaches this percentage or lower.",
    hunger_color = "Hunger alert color",

    show_sanity = "Show sanity alert",
    sanity_threshold = "Sanity threshold",
    sanity_threshold_hover = "Alerts when sanity reaches this percentage or lower.",
    sanity_color = "Sanity alert color",

    show_health = "Show health alert",
    health_threshold = "Health threshold",
    health_threshold_hover = "Alerts when health reaches this percentage or lower.",
    health_color = "Health alert color",

    show_temperature = "Show temperature alert",
    show_temperature_hover = "Hover the temperature thresholds below for details about DST's temperature scale.",
    cold_threshold = "Cold threshold",
    cold_threshold_hover = "Uses DST game units, not °C or °F. Cold visuals start around 4°; freezing damage starts below 0°.",
    cold_color = "Cold alert color",
    heat_threshold = "Heat threshold",
    heat_threshold_hover = "Uses DST game units, not °C or °F. Heat visuals start around 66°; overheating damage starts above 70°.",
    heat_color = "Heat alert color",

    alert_text = "Alert text",
    alert_text_hover = "Values show exact status numbers. Immersive uses varied character-style lines.",
    values = "Values",
    immersive = "Immersive",

    alert_size = "Alert size",
    alert_duration = "Alert duration",
    alert_duration_hover = "How long each alert stays visible.",

    reminder_interval = "Reminder interval",
    reminder_interval_hover = "While a status stays past its threshold, remind again after this time.",
}

-- add locale tables here later. missing entries automatically fall back to english.
local translations = {
}

local localized = translations[locale] or {}

local function text(key)
    return localized[key] or english[key]
end

name = text("mod_name")
description = text("mod_description")
author = "nroj"
version = "0.1.0"

api_version = 10
dst_compatible = true
client_only_mod = true
all_clients_require_mod = false

icon_atlas = "modicon.xml"
icon = "modicon.tex"

local show_options = {
    { description = text("show"), data = true },
    { description = text("hide"), data = false },
}

local color_options = {
    { description = text("red"), data = "red" },
    { description = text("dark_red"), data = "dark_red" },
    { description = text("orange"), data = "orange" },
    { description = text("yellow"), data = "yellow" },
    { description = text("green"), data = "green" },
    { description = text("cyan"), data = "cyan" },
    { description = text("blue"), data = "blue" },
    { description = text("purple"), data = "purple" },
    { description = text("pink"), data = "pink" },
    { description = text("white"), data = "white" },
}

local function percentage_options()
    local options = {}

    for value = 5, 95, 5 do
        options[#options + 1] = {
            description = text("percentage_prefix") .. value .. text("percentage_suffix"),
            data = value / 100,
        }
    end

    return options
end

local function temperature_options(first_value, last_value)
    local options = {}

    for value = first_value, last_value, 5 do
        options[#options + 1] = {
            description = value .. "°",
            data = value,
        }
    end

    return options
end

local size_options = {}

for value = 75, 200, 25 do
    size_options[#size_options + 1] = {
        description = text("percentage_prefix") .. value .. text("percentage_suffix"),
        data = value / 100,
    }
end

local duration_options = {}

for value = 2, 10 do
    duration_options[#duration_options + 1] = {
        description = text("duration_prefix") .. value .. text("duration_suffix"),
        data = value,
    }
end

local reminder_options = {}

for value = 1, 10 do
    reminder_options[#reminder_options + 1] = {
        description = text("reminder_prefix") .. value .. text("reminder_suffix"),
        data = value * 60,
    }
end

local alert_text_options = {
    { description = text("values"), data = "values" },
    { description = text("immersive"), data = "immersive" },
}

local stat_thresholds = percentage_options()
local cold_thresholds = temperature_options(10, 15)
local heat_thresholds = temperature_options(55, 60)

configuration_options = {
    {
        name = "show_hunger",
        label = text("show_hunger"),
        options = show_options,
        default = true,
    },
    {
        name = "hunger_threshold",
        label = text("hunger_threshold"),
        hover = text("hunger_threshold_hover"),
        options = stat_thresholds,
        default = 0.20,
    },
    {
        name = "hunger_color",
        label = text("hunger_color"),
        options = color_options,
        default = "yellow",
    },

    {
        name = "show_sanity",
        label = text("show_sanity"),
        options = show_options,
        default = true,
    },
    {
        name = "sanity_threshold",
        label = text("sanity_threshold"),
        hover = text("sanity_threshold_hover"),
        options = stat_thresholds,
        default = 0.20,
    },
    {
        name = "sanity_color",
        label = text("sanity_color"),
        options = color_options,
        default = "orange",
    },

    {
        name = "show_health",
        label = text("show_health"),
        options = show_options,
        default = true,
    },
    {
        name = "health_threshold",
        label = text("health_threshold"),
        hover = text("health_threshold_hover"),
        options = stat_thresholds,
        default = 0.30,
    },
    {
        name = "health_color",
        label = text("health_color"),
        options = color_options,
        default = "red",
    },

    {
        name = "show_temperature",
        label = text("show_temperature"),
        hover = text("show_temperature_hover"),
        options = show_options,
        default = true,
    },
    {
        name = "cold_threshold",
        label = text("cold_threshold"),
        hover = text("cold_threshold_hover"),
        options = cold_thresholds,
        default = 10,
    },
    {
        name = "cold_color",
        label = text("cold_color"),
        options = color_options,
        default = "cyan",
    },
    {
        name = "heat_threshold",
        label = text("heat_threshold"),
        hover = text("heat_threshold_hover"),
        options = heat_thresholds,
        default = 60,
    },
    {
        name = "heat_color",
        label = text("heat_color"),
        options = color_options,
        default = "dark_red",
    },

    {
        name = "alert_text",
        label = text("alert_text"),
        hover = text("alert_text_hover"),
        options = alert_text_options,
        default = "immersive",
    },
    {
        name = "alert_size",
        label = text("alert_size"),
        options = size_options,
        default = 1.50,
    },
    {
        name = "alert_duration",
        label = text("alert_duration"),
        hover = text("alert_duration_hover"),
        options = duration_options,
        default = 6,
    },
    {
        name = "reminder_interval",
        label = text("reminder_interval"),
        hover = text("reminder_interval_hover"),
        options = reminder_options,
        default = 240,
    },
}
