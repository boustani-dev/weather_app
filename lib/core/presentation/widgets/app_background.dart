import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/gen/assets.gen.dart';

class AppBackground {
  static AssetImage GetAppBackground() {
    DateTime now = DateTime.now();
    String formatedDate = DateFormat('kk').format(now);

    if (int.parse(formatedDate) < 6) {
      return AssetImage(Assets.images.nightLight.path);
    } else if (int.parse(formatedDate) < 18) {
      return AssetImage(Assets.images.dayLight.path);
    } else {
      return AssetImage(Assets.images.nightLight.path);
    }
  }

  static Widget GetWeatherIcons(String description) {
    switch (description) {
      case "clear sky":
        return Image.asset(Assets.icons.cleanSky.path);

      case "few clouds":
        return Image.asset(Assets.icons.fewClouds.path);
      case "scattered clouds":
        return Image.asset(Assets.icons.scatteredClouds.path);
      case "broken clouds":
        return Image.asset(Assets.icons.brokenClouds.path);
      case "shower rain":
        return Image.asset(Assets.icons.showerRain.path);
      case "rain":
        return Image.asset(Assets.icons.rain.path);
      case "thunderstorm":
        return Image.asset(Assets.icons.thunderstorm.path);
      case "snow":
        return Image.asset(Assets.icons.snow.path);
      case "mist":
      default:
        return Image.asset(Assets.icons.unknown.path);

    }
  }
}
