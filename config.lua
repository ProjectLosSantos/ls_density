Config = {}

--budgetLevel: Ranges from 0 to 3, where 0 is lowest (no peds/veh) and 3 is the full budget level.

--All density config
Config.Density = {
    vehBudget = 0.5,
    pedBudget = 0.5
}

-- Night starts at 20:00 (8 PM)
Config.nightStart = 20

-- Night ends at 06:00 (6 AM)
Config.nightEnd = 6

Config.TimeDensities = {
    Night = {
        vehBudget = 0.2,
        pedBudget = 0.1
    },
    Day = {
        vehBudget = 0.5,
        pedBudget = 0.5
    }
}
