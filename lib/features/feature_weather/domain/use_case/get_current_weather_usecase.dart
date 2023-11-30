// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/core/usecase/use_case.dart';
import 'package:weather_app/features/feature_weather/domain/entity/current_city_entity.dart';
import 'package:weather_app/features/feature_weather/domain/repository/weather_repository.dart';


///we extend the UseCase class and override its call method.
class GetCurrentWeatherUsecase extends Usecase<CurrentCityEntity, String> {
  WeatherRepository weatherRepository;
  GetCurrentWeatherUsecase({
    required this.weatherRepository,
  });

  @override
  Future<DataState<CurrentCityEntity>> call(String param) {
    return weatherRepository.fetchCurrentWeatherData(param);
  }
}
