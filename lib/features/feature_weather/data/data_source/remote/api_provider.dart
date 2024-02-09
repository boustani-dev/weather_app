import 'package:dio/dio.dart';
import 'package:weather_app/core/utils/constants.dart';
import 'package:weather_app/features/feature_weather/data/models/forecast_params.dart';

class ApiProvider {
  final Dio dio = Dio();

  var apiKey = Constants.apiKey1;
  var baseUrl = Constants.baseUrl;

//api call to get the current weather
  Future<dynamic> callCurrentWeather(cityName) async {
    try {
      var res = await dio.get(
        '$baseUrl/data/2.5/weather',
        queryParameters: {
          'q': cityName,
          'appid': apiKey,
          'units': 'metric',
        },
      );
      return res;
    } catch (e) {}
  }

  //api call to get the current weather
  Future<dynamic> callForecast16Days(ForeCastParams params) async {
    try {
      var res = await dio.get(
        '$baseUrl/data/2.5/forecast',
        queryParameters: {
          'lat': params.lat,
          'lon': params.lon,
          'appid': apiKey,
          'units': 'metric',
        },
      );
      return res;
    } catch (e) {}
  }
}
