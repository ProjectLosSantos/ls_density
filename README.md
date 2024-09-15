# FiveM Density Manager

## Overview
A fivem density changer

## Features
- **Dynamic Density Adjustments**: Automatically adjusts the densities for vehicles, parked cars, pedestrians, and scenarios depending on whether it's day or night in the game.
- **Custom Day/Night Timeframes**: Define when "night" and "day" begin to customize the density settings for each.
- **Centralized Density Configuration**: Configure default densities that apply at all times, along with specialized settings for night and day.

## Configuration

The script's behavior is controlled by the `Config` table that allows you to easily modify density settings for both day and night, as well as define when the night starts and ends.

### Default Configuration Example:
```lua
Config = {}

-- All density config
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
