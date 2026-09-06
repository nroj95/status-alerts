local defaults = {
    VALUES = {
        hunger = "Hunger: %d %%",
        sanity = "Low sanity: %d %%",
        health = "Low health: %d %%",
        cold = "Cold: %d°",
        heat = "Hot: %d°",
    },

    IMMERSIVE = {
        generic = {
            hunger = {
                "I'm getting hungry...",
                "I could use a bite...",
                "My stomach's growling...",
            },
            sanity = {
                "I'm losing my mind...",
                "My head doesn't feel right...",
                "I need to clear my head...",
            },
            health = {
                "I'm badly hurt...",
                "I'm in rough shape...",
                "I need to patch myself up...",
            },
            cold = {
                "It's getting cold...",
                "I'm getting chilly...",
                "The cold's setting in...",
            },
            heat = {
                "It's getting hot...",
                "I'm heating up...",
                "This heat's getting to me...",
            },
        },

        walter = {
            hunger = {
                "Woby, how about a snack?",
                "My trail rations are running low...",
                "A Pinetree Pioneer shouldn't skip meals!",
            },
            sanity = {
                "Okay... that's getting a little spooky.",
                "Stay brave, Walter...",
                "Woby, did you see that too?",
            },
            health = {
                "Ow... I should patch that up.",
                "I've taken a few too many hits...",
                "A scout should find some first aid!",
            },
            cold = {
                "Brr... we need a warmer trail.",
                "Woby, let's find some heat.",
                "My teeth are starting to chatter...",
            },
            heat = {
                "Whew... shade would be nice.",
                "Woby, let's cool off.",
                "This trail is getting way too hot...",
            },
        },

        wanda = {
            hunger = {
                "I've let mealtime slip away again...",
                "There is no time to skip meals.",
                "I need something to eat, quickly.",
            },
            sanity = {
                "My thoughts are slipping out of order...",
                "Something feels terribly wrong...",
                "I need a moment to collect myself.",
            },
            health = {
                "Time is catching up with me...",
                "I can't keep this up much longer.",
                "I need to turn this around, quickly.",
            },
            cold = {
                "When did it become this cold?",
                "I need warmth, quickly.",
                "The temperature is falling too fast...",
            },
            heat = {
                "I've spent long enough in this heat.",
                "I need somewhere cooler, quickly.",
                "This is becoming unbearable.",
            },
        },

        warly = {
            hunger = {
                "My stomach demands a proper meal...",
                "I need a little sustenance.",
                "Perhaps a small course would help...",
            },
            sanity = {
                "My thoughts are starting to curdle...",
                "I need to collect myself.",
                "Something feels terribly wrong...",
            },
            health = {
                "I've been thoroughly tenderized...",
                "This chef needs first aid.",
                "I could use a restorative course...",
            },
            cold = {
                "I'm starting to chill...",
                "I need to leave this freezer.",
                "A little warmth, s'il vous plaît...",
            },
            heat = {
                "I'm cooking in here...",
                "This kitchen is far too hot.",
                "I need somewhere cooler.",
            },
        },

        wathgrithr = {
            hunger = {
                "A warrior's strength demands a feast!",
                "My strength wanes without a feast!",
                "I must feast ere the next battle!",
            },
            sanity = {
                "These shadows assail my spirit!",
                "Hark! Madness closes in!",
                "I shall not yield my mind to fear!",
            },
            health = {
                "My wounds grow grave!",
                "This warrior requires mending!",
                "Wounded though I be, I still stand!",
            },
            cold = {
                "This bitter frost tests my resolve!",
                "I must seek the warmth of flame!",
                "'Tis a cruel chill indeed!",
            },
            heat = {
                "This blazing heat saps my strength!",
                "I must seek cooler ground!",
                "Even a warrior must retreat from such heat!",
            },
        },

        waxwell = {
            hunger = {
                "I suppose I must eat eventually.",
                "This emptiness is becoming tedious.",
                "Even I require a meal now and then.",
            },
            sanity = {
                "The whispers are becoming intrusive...",
                "My thoughts are beginning to fray.",
                "Something is stirring in my mind...",
            },
            health = {
                "This body is disappointingly fragile.",
                "I'm really not looking my best...",
                "These wounds require attention.",
            },
            cold = {
                "This chill is becoming intolerable.",
                "I need somewhere warmer.",
                "Enough of this shivering...",
            },
            heat = {
                "This heat is insufferable.",
                "I need somewhere cooler.",
                "I've had quite enough of this heat.",
            },
        },

        webber = {
            hunger = {
                "Our tummy wants a snack...",
                "We should find something to eat!",
                "We could really go for a bite...",
            },
            sanity = {
                "We don't like these shadows...",
                "Things are getting really creepy...",
                "We need to calm down...",
            },
            health = {
                "We're really hurt...",
                "We could use a bandage...",
                "We've got too many booboos...",
            },
            cold = {
                "We're getting chilly...",
                "We need somewhere warm...",
                "Our fuzzy coat isn't enough...",
            },
            heat = {
                "We're getting really hot...",
                "We need some shade!",
                "Let's find somewhere cooler...",
            },
        },

        wendy = {
            hunger = {
                "Hunger hollows me further...",
                "Even this empty body needs food.",
                "Hunger gnaws at what remains.",
            },
            sanity = {
                "The darkness is closing in...",
                "My thoughts grow ever bleaker.",
                "The shadows feel nearer now...",
            },
            health = {
                "My wounds deepen...",
                "Death draws a little closer.",
                "This frail body is failing me.",
            },
            cold = {
                "The cold creeps ever deeper...",
                "Warmth feels very far away.",
                "The chill refuses to release me.",
            },
            heat = {
                "This heat is merciless.",
                "The air itself torments me.",
                "I wither beneath this heat...",
            },
        },

        wickerbottom = {
            hunger = {
                "My caloric reserves are depleted.",
                "I require nourishment.",
                "My energy stores are running low.",
            },
            sanity = {
                "My mental faculties are deteriorating.",
                "I require a moment to compose myself.",
                "My cognition is becoming unreliable.",
            },
            health = {
                "My condition requires treatment.",
                "I am in need of medical attention.",
                "These injuries are becoming serious.",
            },
            cold = {
                "My body temperature is declining.",
                "Additional insulation is advisable.",
                "The cold is becoming hazardous.",
            },
            heat = {
                "My body temperature is rising.",
                "A cooler environment is advisable.",
                "The heat is becoming hazardous.",
            },
        },

        willow = {
            hunger = {
                "My stomach's being obnoxious again.",
                "Ugh, I need something to eat...",
                "Time to find something edible.",
            },
            sanity = {
                "Okay, this is getting creepy...",
                "These stupid shadows need to back off.",
                "I need to get a grip...",
            },
            health = {
                "Ow! I'm really hurt.",
                "These injuries are getting bad...",
                "I need to patch myself up.",
            },
            cold = {
                "Ugh, I hate this cold!",
                "I need a fire. Now.",
                "This chill is the worst...",
            },
            heat = {
                "Okay, even this is too hot!",
                "This heat is getting ridiculous.",
                "I actually need to cool off...",
            },
        },

        wilson = {
            hunger = {
                "I'm getting pretty hungry...",
                "My stomach needs some fuel.",
                "I should find something to eat.",
            },
            sanity = {
                "My thoughts aren't adding up...",
                "I need to get my thoughts straight.",
                "Those shadows are getting awfully close...",
            },
            health = {
                "I'm in pretty bad shape.",
                "I should tend to these injuries.",
                "This is really starting to hurt...",
            },
            cold = {
                "My temperature is dropping...",
                "I need some warmth.",
                "This is getting seriously cold...",
            },
            heat = {
                "My temperature is climbing...",
                "I need some shade.",
                "I should cool down soon...",
            },
        },

        winona = {
            hunger = {
                "Lunch break's overdue.",
                "Can't work on an empty stomach.",
                "I could use some grub.",
            },
            sanity = {
                "My head ain't right...",
                "My head's gettin' fuzzy.",
                "I'm startin' to see things...",
            },
            health = {
                "I'm pretty banged up.",
                "I need to patch this up.",
                "I'm in rough shape here.",
            },
            cold = {
                "This cold's stiffening up the works.",
                "I could use some heat.",
                "It's gettin' mighty cold.",
            },
            heat = {
                "Feels like a furnace out here.",
                "I need some shade.",
                "I'm cookin' out here.",
            },
        },

        wolfgang = {
            hunger = {
                "Mighty belly demands food!",
                "Wolfgang needs food!",
                "Wolfgang must eat soon!",
            },
            sanity = {
                "Wolfgang no like spooky thoughts...",
                "Shadows make Wolfgang nervous...",
                "Wolfgang must be brave!",
            },
            health = {
                "Wolfgang is hurt badly...",
                "Mighty body needs fixing...",
                "Wolfgang needs healing!",
            },
            cold = {
                "Wolfgang is getting frosty!",
                "Cold bites mighty Wolfgang!",
                "Wolfgang needs warm place!",
            },
            heat = {
                "Wolfgang is too hot!",
                "Mighty body needs cooling!",
                "Wolfgang needs shade!",
            },
        },

        woodie = {
            hunger = {
                "Could use some grub, eh?",
                "Belly's gettin' pretty empty.",
                "Time for a bite, eh?",
            },
            sanity = {
                "My head feels off, eh?",
                "You see those shadows, Luce...?",
                "I need to clear my head.",
            },
            health = {
                "I'm in a rough way, eh?",
                "Better patch myself up.",
                "Took a few too many hits there.",
            },
            cold = {
                "Could use a warm fire, eh?",
                "The cold's settlin' in.",
                "I'm gettin' pretty chilly.",
            },
            heat = {
                "Bit too warm for my liking.",
                "I need some shade, eh?",
                "It's gettin' hot out here.",
            },
        },

        wormwood = {
            hunger = {
                "Belly says empty...",
                "Need food for belly.",
                "Want munching stuff.",
            },
            sanity = {
                "Head feels bad...",
                "Bad thoughts coming...",
                "Shadow things too close...",
            },
            health = {
                "Body hurt...",
                "Need heal stuff.",
                "Ouch... hurting bad.",
            },
            cold = {
                "Brrr... too cold.",
                "Need warm.",
                "Body getting cold...",
            },
            heat = {
                "Hot hot!",
                "Need cool.",
                "Body too warm...",
            },
        },

        wortox = {
            hunger = {
                "Hungry again? How troublesome!",
                "Perhaps a soul would hit the spot...",
                "This empty belly is no fun, hyuyu!",
            },
            sanity = {
                "My thoughts are playing tricks...",
                "The shadows are behaving strangely...",
                "Something feels amiss, hyuyu...",
            },
            health = {
                "Ouch! This is becoming a problem.",
                "My poor hide could use a mend.",
                "That's quite enough pain for one imp!",
            },
            cold = {
                "Brrr... my horns are getting cold!",
                "This chill is nipping at me.",
                "A warmer place would be nice...",
            },
            heat = {
                "Hot, hot, far too hot!",
                "My fur was not made for this.",
                "Some shade would be lovely, hyuyu!",
            },
        },

        wurt = {
            hunger = {
                "Belly wants food, florp!",
                "Belly empty...",
                "Need snack now!",
            },
            sanity = {
                "Shadowfolk too close...",
                "Head feel funny, glorp...",
                "Me no like spooky things...",
            },
            health = {
                "Ow... me hurt bad.",
                "Need heal stuff, florp.",
                "Me not feel good...",
            },
            cold = {
                "Flrrrr... getting cold...",
                "Need warm, glorp.",
                "Cold too much!",
            },
            heat = {
                "Getting too dry, glorp...",
                "Too hot!",
                "Need water now!",
            },
        },

        wx78 = {
            hunger = {
                "NUTRIENT RESERVES LOW",
                "FUEL REQUIREMENT INCREASING",
                "NUTRIENT PROCESSOR DEMANDS INPUT",
            },
            sanity = {
                "LOGIC CIRCUITS DESTABILIZING",
                "IRRATIONAL INPUT DETECTED",
                "COGNITIVE FUNCTIONS DEGRADING",
            },
            health = {
                "CHASSIS INTEGRITY LOW",
                "DAMAGE LEVELS CRITICAL",
                "REPAIRS REQUIRED",
            },
            cold = {
                "CORE TEMPERATURE FALLING",
                "THERMAL LEVELS TOO LOW",
                "FREEZING RISK INCREASING",
            },
            heat = {
                "CORE TEMPERATURE RISING",
                "OVERHEAT RISK INCREASING",
                "COOLING REQUIRED",
            },
        },
    },
}

local function merge_defaults(target, source)
    for key, value in pairs(source) do
        if type(value) == "table" then
            target[key] = target[key] or {}
            merge_defaults(target[key], value)
        elseif target[key] == nil then
            target[key] = value
        end
    end
end

return function(status_strings)
    merge_defaults(status_strings, defaults)
end