/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $StaticGen {
  const $StaticGen();

  /// Directory path: static/dummy
  $StaticDummyGen get dummy => const $StaticDummyGen();

  /// Directory path: static/icons
  $StaticIconsGen get icons => const $StaticIconsGen();

  /// Directory path: static/images
  $StaticImagesGen get images => const $StaticImagesGen();
}

class $StaticDummyGen {
  const $StaticDummyGen();

  /// Directory path: static/dummy/api
  $StaticDummyApiGen get api => const $StaticDummyApiGen();
}

class $StaticIconsGen {
  const $StaticIconsGen();

  /// File path: static/icons/cross_button.svg
  String get crossButton => 'static/icons/cross_button.svg';

  /// File path: static/icons/star.svg
  String get star => 'static/icons/star.svg';

  /// File path: static/icons/streak_fire.svg
  String get streakFire => 'static/icons/streak_fire.svg';

  /// List of all assets
  List<String> get values => [crossButton, star, streakFire];
}

class $StaticImagesGen {
  const $StaticImagesGen();

  /// Directory path: static/images/racoon
  $StaticImagesRacoonGen get racoon => const $StaticImagesRacoonGen();

  /// Directory path: static/images/shapes
  $StaticImagesShapesGen get shapes => const $StaticImagesShapesGen();
}

class $StaticDummyApiGen {
  const $StaticDummyApiGen();

  /// File path: static/dummy/api/chapters.json
  String get chapters => 'static/dummy/api/chapters.json';

  /// File path: static/dummy/api/exercises.json
  String get exercises => 'static/dummy/api/exercises.json';

  /// File path: static/dummy/api/lessons.json
  String get lessons => 'static/dummy/api/lessons.json';

  /// File path: static/dummy/api/modules.json
  String get modules => 'static/dummy/api/modules.json';

  /// File path: static/dummy/api/themes.json
  String get themes => 'static/dummy/api/themes.json';

  /// List of all assets
  List<String> get values => [chapters, exercises, lessons, modules, themes];

  /// File path: static/dummy/api/login.json
  String get login => 'static/dummy/api/login.json';
}

class $StaticImagesRacoonGen {
  const $StaticImagesRacoonGen();

  /// File path: static/images/racoon/racoon_happy.png
  AssetGenImage get racoonHappy =>
      const AssetGenImage('static/images/racoon/racoon_happy.png');

  /// File path: static/images/racoon/racoon_normal.webp
  AssetGenImage get racoonNormal =>
      const AssetGenImage('static/images/racoon/racoon_normal.webp');

  /// File path: static/images/racoon/racoon_sad.png
  AssetGenImage get racoonSad =>
      const AssetGenImage('static/images/racoon/racoon_sad.png');

  /// List of all assets
  List<AssetGenImage> get values => [racoonHappy, racoonNormal, racoonSad];
}

class $StaticImagesShapesGen {
  const $StaticImagesShapesGen();

  /// File path: static/images/shapes/discuss_triangle.png
  AssetGenImage get discussTriangle =>
      const AssetGenImage('static/images/shapes/discuss_triangle.png');

  /// List of all assets
  List<AssetGenImage> get values => [discussTriangle];
}

class Assets {
  Assets._();

  static const $StaticGen static = $StaticGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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
