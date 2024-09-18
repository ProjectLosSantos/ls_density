local config = {}
config.density = {
    vehicle = 0.55,
    parked = 1.0,
    peds = 1.0,
    scenario = 0.55,
}

-- Night starts at 20:00 (8 PM)
config.nightStart = 20

-- Night ends at 06:00 (6 AM)
config.nightEnd = 6

config.timeDensities = {

    [10] = {
        night = {
            vehicle = 0.11,
            parked = 1.0,
            peds = 0.1,
            scenarios = 0.25
        },
        day = {
            vehicle = 0.55,
            parked = 0.25,
            peds = 0.70,
            scenarios = 0.55
        }
    },

    [20] = {
        night = {
            vehicle = 0.25,
            parked = 1.0,
            peds = 0.1,
            scenarios = 0.25
        },
        day = {
            vehicle = 0.55,
            parked = 0.25,
            peds = 0.70,
            scenarios = 0.55
        }
    },

    [30] = {
        night = {
            vehicle = 0.123123,
            parked = 1.0,
            peds = 0.1,
            scenarios = 0.25
        },
        day = {
            vehicle = 0.55,
            parked = 0.25,
            peds = 0.70,
            scenarios = 0.55
        }
    }
}


return config
