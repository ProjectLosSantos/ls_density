# FiveM Density Manager

## Overview
The FiveM Density Manager is a script designed to dynamically manage various in-game densities, such as vehicle traffic, parked cars, pedestrians, and scenarios, based on the time of day. It provides easy-to-configure options to adjust these densities for day and night cycles, enhancing the realism of your FiveM server.

## Features
- **Dynamic Density Adjustments**: Automatically adjusts the densities for vehicles, parked cars, pedestrians, and scenarios depending on whether it's day or night in the game.
- **Custom Day/Night Timeframes**: Define when "night" and "day" begin to customize the density settings for each.
- **Centralized Density Configuration**: Configure default densities that apply at all times, along with specialized settings for night and day.
- **Flexible Density Management**: The script allows for quick changes in spawn rates, ensuring performance optimization while keeping a realistic feel.

## Configuration

The script's behavior is controlled by a `Config` table that allows you to easily modify density settings for both day and night, as well as define when the night starts and ends.

### Available Configuration Options:

- **`Config.Density`**: Controls the default densities that are applied throughout the day. You can set values for:
  - `Vehicle`: General vehicle traffic density.
  - `Parked`: Density of parked cars.
  - `Peds`: Density of pedestrians.
  - `Scenarios`: Density of scenario events (ambient events such as NPC activities).

- **`Config.nightStart`**: Defines the hour when the night starts. Default: `20` (8 PM).
  
- **`Config.nightEnd`**: Defines the hour when the night ends. Default: `6` (6 AM).

- **`Config.TimeDensities`**: Allows you to define different densities for day and night:
  - **`Night`**:
    - `Vehicle`: Density of vehicles at night.
    - `Parked`: Density of parked cars at night.
    - `Peds`: Density of pedestrians at night.
    - `Scenarios`: Density of scenarios at night.
  
  - **`Day`**:
    - `Vehicle`: Density of vehicles during the day.
    - `Parked`: Density of parked cars during the day.
    - `Peds`: Density of pedestrians during the day.
    - `Scenarios`: Density of scenarios during the day.

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
