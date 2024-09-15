CreateThread(function()
    while true do
            SetVehicleDensityMultiplierThisFrame(Config.Density['Vehicle'])
            SetPedDensityMultiplierThisFrame(Config.Density['Peds'])
            SetParkedVehicleDensityMultiplierThisFrame(Config.Density['Parked'])
            SetScenarioPedDensityMultiplierThisFrame(Config.Density['Scenario'], Config.Density['Scenario'])
            SetVehicleModelIsSuppressed(GetHashKey("blimp"), true)
            Wait(1000) -- resarching showed that this shit can be waited for 1000
        else
            Wait(5000)
        end
        Wait(1)
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
                SetDensity('Vehicle', Config.TimeDensities.Night.Vehicle)
                SetDensity('Parked', Config.TimeDensities.Night.Parked)
                SetDensity('Peds', Config.TimeDensities.Night.Peds)
                SetDensity('Scenarios', Config.TimeDensities.Night.Scenarios)
            else
                -- Set densities for day
                SetDensity('Vehicle', Config.TimeDensities.Day.Vehicle)
                SetDensity('Parked', Config.TimeDensities.Day.Parked)
                SetDensity('Peds', Config.TimeDensities.Day.Peds)
                SetDensity('Scenarios', Config.TimeDensities.Day.Scenarios)
            end
            wasNight = isNight
        end
    end
end)
