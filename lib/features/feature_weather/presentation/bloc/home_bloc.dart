import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:weather_app/core/resources/data_state.dart';
import 'package:weather_app/features/feature_weather/domain/use_case/get_current_weather_usecase.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/cw_status.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCurrentWeatherUsecase getCurrentWeatherUsecase;
  HomeBloc({required this.getCurrentWeatherUsecase})
      : super(HomeState(cwStatus: CwLoading())) {
    on<LoadCwEvent>(
      (event, emit) async {
        emit(state.copyWith(newCwStatus: CwLoading()));
        DataState dataState = await getCurrentWeatherUsecase(event.cityName);
        if (dataState is DataSuccessState) {
          emit(state.copyWith(newCwStatus: CwLoaded(dataState.data)));
        }
        if (dataState is DataFailState) {
          emit(state.copyWith(
              newCwStatus: CwError(dataState.error ?? 'not loaded!!')));
        }
      },
    );
  }
}
