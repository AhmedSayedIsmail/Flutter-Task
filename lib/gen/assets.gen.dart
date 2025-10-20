// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ModaM.png
  AssetGenImage get modaM => const AssetGenImage('assets/images/ModaM.png');

  /// File path: assets/images/jacketB.png
  AssetGenImage get jacketB => const AssetGenImage('assets/images/jacketB.png');

  /// File path: assets/images/makeup.png
  AssetGenImage get makeup => const AssetGenImage('assets/images/makeup.png');

  /// File path: assets/images/phone.png
  AssetGenImage get phone => const AssetGenImage('assets/images/phone.png');

  /// File path: assets/images/shirt.png
  AssetGenImage get shirt => const AssetGenImage('assets/images/shirt.png');

  /// File path: assets/images/shose.png
  AssetGenImage get shose => const AssetGenImage('assets/images/shose.png');

  /// File path: assets/images/talat_logo.png
  AssetGenImage get talatLogo =>
      const AssetGenImage('assets/images/talat_logo.png');

  /// File path: assets/images/watch.png
  AssetGenImage get watch => const AssetGenImage('assets/images/watch.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    modaM,
    jacketB,
    makeup,
    phone,
    shirt,
    shose,
    talatLogo,
    watch,
  ];
}

class $AssetsSvgGen {
  const $AssetsSvgGen();

  /// File path: assets/svg/Photo Container.svg
  String get photoContainer => 'assets/svg/Photo Container.svg';

  /// File path: assets/svg/bxs_offer.svg
  String get bxsOffer => 'assets/svg/bxs_offer.svg';

  /// File path: assets/svg/jacketB.svg
  String get jacketB => 'assets/svg/jacketB.svg';

  /// File path: assets/svg/makeup.svg
  String get makeup => 'assets/svg/makeup.svg';

  /// File path: assets/svg/shirt.svg
  String get shirt => 'assets/svg/shirt.svg';

  /// File path: assets/svg/shose.svg
  String get shose => 'assets/svg/shose.svg';

  /// File path: assets/svg/talat_logo.svg
  String get talatLogo => 'assets/svg/talat_logo.svg';

  /// File path: assets/svg/watch.svg
  String get watch => 'assets/svg/watch.svg';

  /// List of all assets
  List<String> get values => [
    photoContainer,
    bxsOffer,
    jacketB,
    makeup,
    shirt,
    shose,
    talatLogo,
    watch,
  ];
}

class $AssetsTranslationGen {
  const $AssetsTranslationGen();

  /// File path: assets/translation/ar.json
  String get ar => 'assets/translation/ar.json';

  /// File path: assets/translation/en.json
  String get en => 'assets/translation/en.json';

  /// List of all assets
  List<String> get values => [ar, en];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsSvgGen svg = $AssetsSvgGen();
  static const $AssetsTranslationGen translation = $AssetsTranslationGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

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
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
