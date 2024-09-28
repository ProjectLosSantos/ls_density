CreateThread(function()
    while true do
            -- Use the values from the config
            SetVehiclePopulationBudget(Config.Density.vehBudget)
            SetPedPopulationBudget(Config.Density.pedBudget)
            Wait(1000) -- A 1000ms wait is acceptable based on research
        Wait(1)
    end
end)

function SetDensity(Type, Value)
    if Config.Density[Type] == Value then
        return
    end
    print(string.format('[DENSITY] Type:%s Value:%s', Type, Value))
    Config.Density[Type] = Value
end
exports("SetDensity", SetDensity)

CreateThread(function()
    local wasNight = nil

    while true do
        Wait(5000)
        local hour = GetClockHours()
        local isNight = (hour >= Config.nightStart or hour < Config.nightEnd)

        if wasNight ~= isNight then
            if isNight then
                -- Set densities for night
                SetDensity('vehBudget', Config.TimeDensities.Night.vehBudget)
                SetDensity('pedBudget', Config.TimeDensities.Night.pedBudget)
            else
                -- Set densities for day
                SetDensity('vehBudget', Config.TimeDensities.Day.vehBudget)
                SetDensity('pedBudget', Config.TimeDensities.Day.pedBudget)
            end
            wasNight = isNight
        end
    end
end)
