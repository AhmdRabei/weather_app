import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherSevices {
  Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '8e149b0bbfc841bdac1105618242001';

  WeatherSevices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      final String errMessege = e.response?.data['error']['message'] ??
          'Opps there was an error try later';
      throw Exception(errMessege);
    }
  }
}
