/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/broken-clouds.png
  AssetGenImage get brokenClouds =>
      const AssetGenImage('assets/icons/broken-clouds.png');

  /// File path: assets/icons/clean_sky.png
  AssetGenImage get cleanSky =>
      const AssetGenImage('assets/icons/clean_sky.png');

  /// File path: assets/icons/few-clouds.png
  AssetGenImage get fewClouds =>
      const AssetGenImage('assets/icons/few-clouds.png');

  /// File path: assets/icons/mist.png
  AssetGenImage get mist => const AssetGenImage('assets/icons/mist.png');

  /// File path: assets/icons/rain.png
  AssetGenImage get rain => const AssetGenImage('assets/icons/rain.png');

  /// File path: assets/icons/scattered-clouds.png
  AssetGenImage get scatteredClouds =>
      const AssetGenImage('assets/icons/scattered-clouds.png');

  /// File path: assets/icons/shower-rain.png
  AssetGenImage get showerRain =>
      const AssetGenImage('assets/icons/shower-rain.png');

  /// File path: assets/icons/snow.png
  AssetGenImage get snow => const AssetGenImage('assets/icons/snow.png');

  /// File path: assets/icons/thunderstorm.png
  AssetGenImage get thunderstorm =>
      const AssetGenImage('assets/icons/thunderstorm.png');

  /// File path: assets/icons/unknown.png
  AssetGenImage get unknown => const AssetGenImage('assets/icons/unknown.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        brokenClouds,
        cleanSky,
        fewClouds,
        mist,
        rain,
        scatteredClouds,
        showerRain,
        snow,
        thunderstorm,
        unknown
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/dayLight.jpg
  AssetGenImage get dayLight =>
      const AssetGenImage('assets/images/dayLight.jpg');

  /// File path: assets/images/nightLight.jpg
  AssetGenImage get nightLight =>
      const AssetGenImage('assets/images/nightLight.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [dayLight, nightLight];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
