import 'package:dio/dio.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/feature_weather/data/models/current_city_model.dart';
import 'package:weather_app/features/feature_weather/domain/entity/current_city_entity.dart';
import 'package:weather_app/features/feature_weather/domain/repository/weather_repository.dart';
///"Here, we implement the body of the functions that exist in the WeatherRepository."
class WeatherRepositoryImpl extends WeatherRepository {
  ApiProvider apiProvider;
  WeatherRepositoryImpl({
    required this.apiProvider,
  });

  //Fetch Current weather data From Server
  @override
  Future<DataState<CurrentCityEntity>> fetchCurrentWeatherData(
      String cityName) async {
    try {
      Response res = await apiProvider.callCurrentWeather(cityName);
      if (res.statusCode == 200) {
        CurrentCityEntity weather = CurrentCityModel.fromJson(res.data);
        return DataSuccessState(weather);
      } else {
        throw 'SomeThing went wrong,try again...';
      }
    } catch (e) {
      throw 'please check your internet connection.';
    }
  }
}
