import 'package:flutter/material.dart';
import 'package:weather_app/core/presentation/widgets/app_background.dart';
import 'package:weather_app/core/presentation/widgets/botton_nav.dart';
import 'package:weather_app/features/feature_bookmark/presentation/screens/Bookmark_screen.dart';
import 'package:weather_app/features/feature_weather/presentation/screens/home_screen.dart';

// class MainWrapper extends StatefulWidget {
//   const MainWrapper({super.key});
//
//   @override
//   State<MainWrapper> createState() => _MainWrapperState();
// }
//
// class _MainWrapperState extends State<MainWrapper> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     BlocProvider.of<HomeBloc>(context).add(LoadCwEvent(cityName: 'Tehran'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar:
//       AppBar(),
//       body:
//     );
//   }
// }

class MainWrapper extends StatelessWidget {
  MainWrapper({super.key});

  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    List<Widget> pages = [
      const HomeScreen(),
      const BookMarkScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNav(
        controller: _controller,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AppBackground.GetAppBackground(), fit: BoxFit.cover),
        ),
        height: height,
        child: PageView.builder(
          itemCount: pages.length,
          controller: _controller,
          itemBuilder: (context, index) {
            return pages[index];
          },
        ),
      ),
    );
  }
}
