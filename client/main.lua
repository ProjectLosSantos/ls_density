local config = require 'config'

local function getClosestConfig(playerCount)
    local closestKey = nil
    local minDiff = math.huge

    for key, _ in pairs(config.timeDensities) do
        local diff = key - playerCount
        if diff >= 0 then
            if diff < minDiff then
                minDiff = diff
                closestKey = key
            end
        end
    end

    if closestKey then
        return config.timeDensities[closestKey]
    else
        return nil
    end
end


CreateThread(function()
    while true do
        SetVehicleDensityMultiplierThisFrame(config.density.vehicle)
        SetPedDensityMultiplierThisFrame(config.density.peds)
        SetParkedVehicleDensityMultiplierThisFrame(config.density.parked)
        SetScenarioPedDensityMultiplierThisFrame(config.density.scenario, config.density.scenario)
        SetVehicleModelIsSuppressed(GetHashKey("blimp"), true)
        Wait(1000)
    end
end)

exports("setDensity", setDensity)

function setDensity(type, value)
    if not config.density[type] then return false end
    if type(value) ~= 'number' then return false end
    print(string.format('[DENSITY] Type:%s Value:%s', type, value))

    config.density[type] = value
end

CreateThread(function()
    local wasNight = nil

    while true do
        Wait(10000)
        local hour = GetClockHours()
        local isNight = (hour >= config.nightStart or hour < config.nightEnd)
        local playersAmount = #GetActivePlayers()
        if wasNight ~= isNight then
            local densitySettings = getClosestConfig(playersAmount)
            if densitySettings == nil then
                print('[DENSITY] Something wrong with the config')
                break
            end

            if isNight then
                setDensity('vehicle', densitySettings.night.vehicle)
                setDensity('parked', densitySettings.night.parked)
                setDensity('peds', densitySettings.night.peds)
                setDensity('scenarios', densitySettings.night.scenarios)
            else
                setDensity('vehicle', densitySettings.day.vehicle)
                setDensity('parked', densitySettings.day.parked)
                setDensity('peds', densitySettings.day.peds)
                setDensity('scenarios', densitySettings.day.scenarios)
            end
            wasNight = isNight
        end
    end
end)
