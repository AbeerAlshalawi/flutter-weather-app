# Weather App

This is a weather app made with Flutter and Weatherbit API.

## Features

- **Current Location Weather:** Automatically detects and displays weather data for your current location.
- **Current Weather Condition:** Provides the current temperature, weather condition, humidity level, and wind speed.
- **Hourly Forecast:** Offers an hourly forecast for the next 24 hours.
- **Daily Forecast:** Displays a daily forecast for the next 7 days.

## Implementation Details

- **Front-End:** Built with Flutter.
- **Weather API:** Weather data is fetched using the Weatherbit API through HTTP requests.
- **Architecture:** The app follows the MVVM architecture.
- **State Management:** Riverpod is used for managing state and handling API calls.

## Installing

1. Clone this repository
2. Get your Weatherbit API key
3. Create a .env file and add your API key like this:
```
API_KEY = 'your_key'
```