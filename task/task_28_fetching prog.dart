import 'dart:async';

void main() async {
  print('Fetching weather data...');

  String weatherData = await fetchWeatherData();

  print('Weather data loaded successfully:');
  print(weatherData);
}

Future<String> fetchWeatherData() async {
  print('Fetching data...');

  await Future.delayed(Duration(seconds: 2));

  print('Processing data...');

  await Future.delayed(Duration(seconds: 2));

  return 'Temperature: 25°C, Humidity: 60%, Conditions: Sunny';
}
