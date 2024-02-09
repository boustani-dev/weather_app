import 'package:get_it/get_it.dart';
import 'package:weather_app/features/feature_weather/data/data_source/remote/api_provider.dart';
import 'package:weather_app/features/feature_weather/data/repository/weather_repository_imp.dart';
import 'package:weather_app/features/feature_weather/domain/repository/weather_repository.dart';
import 'package:weather_app/features/feature_weather/domain/use_case/get_current_weather_usecase.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/home_bloc.dart';

GetIt locator = GetIt.instance;

setup() {
  locator.registerLazySingleton<ApiProvider>(() => ApiProvider());

  //repositories
  locator.registerLazySingleton<WeatherRepository>(() =>
      WeatherRepositoryImpl(apiProvider: locator<ApiProvider>()));

  //usecase
  locator.registerLazySingleton<GetCurrentWeatherUsecase>(() =>
      GetCurrentWeatherUsecase(weatherRepository: locator<WeatherRepository>()));

  locator.registerLazySingleton<HomeBloc>(() => HomeBloc(
      getCurrentWeatherUsecase: locator<GetCurrentWeatherUsecase>()
  ));
}
