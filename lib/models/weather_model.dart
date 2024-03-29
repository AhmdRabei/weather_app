class WeatherModel {
  final String cityName;
  final DateTime lastUploaded;
  final double temp;
  final String? weatherCondition;
  final double maxTemp;
  final double minTemp;
  final String weatherImage;

  const WeatherModel({
    required this.cityName,
    required this.lastUploaded,
    required this.temp,
    required this.weatherCondition,
    required this.weatherImage,
    required this.maxTemp,
    required this.minTemp,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      lastUploaded: DateTime.parse(json['current']['last_updated']),
      temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherCondition: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      weatherImage: json['forecast']['forecastday'][0]['day']['condition']
          ['icon'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}
