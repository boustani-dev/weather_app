import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
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
  PageController _pageController = PageController();

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
              child: ListView(
                children: [
                  SizedBox(
                    height: 400,
                    child: PageView.builder(
                      itemCount: 2,
                      allowImplicitScrolling: true,
                      controller: _pageController,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Column(
                            children: [
                              Text(
                                cwCompleted.name!,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 30),
                              ),
                              Text(
                                cwCompleted.weather![0].description!,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 12),
                              ),
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: AppBackground.GetWeatherIcons(
                                  cwCompleted.weather![0].description!,
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                '${cwCompleted!.main!.temp!.round()}\u00B0',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 50,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      const Text(
                                        'Max',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${cwCompleted.main!.tempMax!.round()}\u00B0',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: 40,
                                      width: 2,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Text(
                                        'Min',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        '${cwCompleted.main!.tempMin!.round()}\u00B0',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                        if (index == 1) {}
                        return Container(
                          color: Colors.amber,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                      child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 2,
                    axisDirection: Axis.horizontal,
                    effect:const ExpandingDotsEffect(dotColor: Colors.white),
                  )),
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
