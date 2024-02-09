import 'package:weather_app/features/feature_weather/domain/entity/current_city_entity.dart';

abstract class CwStatus {}

class CwLoading extends CwStatus {}

class CwLoaded extends CwStatus {
  final CurrentCityEntity currentCityEntity;
  CwLoaded(this.currentCityEntity);
}

class CwError extends CwStatus {
  final String message;
  CwError(this.message);
}
