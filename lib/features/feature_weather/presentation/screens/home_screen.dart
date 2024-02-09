import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/presentation/widgets/app_background.dart';
import 'package:weather_app/core/presentation/widgets/loading_kit.dart';
import 'package:weather_app/features/feature_weather/domain/entity/current_city_entity.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/cw_status.dart';
import 'package:weather_app/features/feature_weather/presentation/bloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String cityName = 'Tehran';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName: cityName));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.cwStatus is CwLoading) {
            return const Center(
              child: LoadingKit(),
            );
          }
          if (state.cwStatus is CwLoaded) {
            CwLoaded cwLoaded = state.cwStatus as CwLoaded;
            CurrentCityEntity cwCompleted = cwLoaded.currentCityEntity;
            return Expanded(
              child: Column(
                children: [
                  Text(
                    cwCompleted.name!,
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    cwCompleted.weather![0].description!,
                    style: const TextStyle(color: Colors.grey, fontSize: 20),
                  ),
                  SizedBox(
                    height: 80,
                    width: 80,
                    child: AppBackground.GetWeatherIcons(cwCompleted.weather![0].description!,),
                  ),
                ],
              ),
            );
          }
          if (state.cwStatus is CwError) {
            return Center(child: Text('Error'));
          }
          return SizedBox();
        },
      ),
    );
  }
}
