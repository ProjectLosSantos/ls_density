Config = {}

--All density config
Config.Density = {
    ['Vehicle'] = 0.55,
    ['Parked'] = 1.0,
    ['Peds'] = 1.0,
    ['Scenarios'] = 0.55,
}

-- Night starts at 20:00 (8 PM)
Config.nightStart = 20

-- Night ends at 06:00 (6 AM)
Config.nightEnd = 6

Config.TimeDensities = {
    Night = {
        Vehicle = 0.25,
        Parked = 1.0,
        Peds = 0.1,
        Scenarios = 0.25
    },
    Day = {
        Vehicle = 0.55,
        Parked = 0.25,
        Peds = 0.70,
        Scenarios = 0.55
    }
}