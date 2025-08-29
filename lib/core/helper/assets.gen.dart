/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Arimo.ttf
  String get arimo => 'assets/fonts/Arimo.ttf';

  /// File path: assets/fonts/Outfit-Black.ttf
  String get outfitBlack => 'assets/fonts/Outfit-Black.ttf';

  /// File path: assets/fonts/Outfit-Bold.ttf
  String get outfitBold => 'assets/fonts/Outfit-Bold.ttf';

  /// File path: assets/fonts/Outfit-ExtraBold.ttf
  String get outfitExtraBold => 'assets/fonts/Outfit-ExtraBold.ttf';

  /// File path: assets/fonts/Outfit-ExtraLight.ttf
  String get outfitExtraLight => 'assets/fonts/Outfit-ExtraLight.ttf';

  /// File path: assets/fonts/Outfit-Light.ttf
  String get outfitLight => 'assets/fonts/Outfit-Light.ttf';

  /// File path: assets/fonts/Outfit-Medium.ttf
  String get outfitMedium => 'assets/fonts/Outfit-Medium.ttf';

  /// File path: assets/fonts/Outfit-Regular.ttf
  String get outfitRegular => 'assets/fonts/Outfit-Regular.ttf';

  /// File path: assets/fonts/Outfit-SemiBold.ttf
  String get outfitSemiBold => 'assets/fonts/Outfit-SemiBold.ttf';

  /// File path: assets/fonts/Outfit-Thin.ttf
  String get outfitThin => 'assets/fonts/Outfit-Thin.ttf';

  /// List of all assets
  List<String> get values => [
    arimo,
    outfitBlack,
    outfitBold,
    outfitExtraBold,
    outfitExtraLight,
    outfitLight,
    outfitMedium,
    outfitRegular,
    outfitSemiBold,
    outfitThin,
  ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img-black-on-white.jpg
  AssetGenImage get imgBlackOnWhite =>
      const AssetGenImage('assets/images/img-black-on-white.jpg');

  /// File path: assets/images/img-bold-black-on-white.jpg
  AssetGenImage get imgBoldBlackOnWhite =>
      const AssetGenImage('assets/images/img-bold-black-on-white.jpg');

  /// File path: assets/images/img-bold-white-on-black.jpg
  AssetGenImage get imgBoldWhiteOnBlack =>
      const AssetGenImage('assets/images/img-bold-white-on-black.jpg');

  /// File path: assets/images/img-purple-on-trans.png
  AssetGenImage get imgPurpleOnTrans =>
      const AssetGenImage('assets/images/img-purple-on-trans.png');

  /// File path: assets/images/img-stack-purple-on-trans.png
  AssetGenImage get imgStackPurpleOnTrans =>
      const AssetGenImage('assets/images/img-stack-purple-on-trans.png');

  /// File path: assets/images/img-star-gradient.png
  AssetGenImage get imgStarGradient =>
      const AssetGenImage('assets/images/img-star-gradient.png');

  /// File path: assets/images/img-star.png
  AssetGenImage get imgStar =>
      const AssetGenImage('assets/images/img-star.png');

  /// File path: assets/images/img-welcome.png
  AssetGenImage get imgWelcome =>
      const AssetGenImage('assets/images/img-welcome.png');

  /// File path: assets/images/img-white-on-black.jpg
  AssetGenImage get imgWhiteOnBlack =>
      const AssetGenImage('assets/images/img-white-on-black.jpg');

  /// File path: assets/images/success_svg.png
  AssetGenImage get successSvg =>
      const AssetGenImage('assets/images/success_svg.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    imgBlackOnWhite,
    imgBoldBlackOnWhite,
    imgBoldWhiteOnBlack,
    imgPurpleOnTrans,
    imgStackPurpleOnTrans,
    imgStarGradient,
    imgStar,
    imgWelcome,
    imgWhiteOnBlack,
    successSvg,
  ];
}

class $AssetsKeysGen {
  const $AssetsKeysGen();

  /// File path: assets/keys/.env
  String get aEnv => 'assets/keys/.env';

  /// List of all assets
  List<String> get values => [aEnv];
}

class $AssetsSvgsGen {
  const $AssetsSvgsGen();

  /// File path: assets/svgs/Bitcoin.svg
  SvgGenImage get bitcoin => const SvgGenImage('assets/svgs/Bitcoin.svg');

  /// File path: assets/svgs/Eth.svg
  SvgGenImage get eth => const SvgGenImage('assets/svgs/Eth.svg');

  /// File path: assets/svgs/Usdt.svg
  SvgGenImage get usdt => const SvgGenImage('assets/svgs/Usdt.svg');

  /// File path: assets/svgs/bookflight.svg
  SvgGenImage get bookflight => const SvgGenImage('assets/svgs/bookflight.svg');

  /// File path: assets/svgs/buycrypto.svg
  SvgGenImage get buycrypto => const SvgGenImage('assets/svgs/buycrypto.svg');

  /// File path: assets/svgs/callcenter.svg
  SvgGenImage get callcenter => const SvgGenImage('assets/svgs/callcenter.svg');

  /// File path: assets/svgs/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/svgs/notification.svg');

  /// File path: assets/svgs/sellcrypto.svg
  SvgGenImage get sellcrypto => const SvgGenImage('assets/svgs/sellcrypto.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    bitcoin,
    eth,
    usdt,
    bookflight,
    buycrypto,
    callcenter,
    notification,
    sellcrypto,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsKeysGen keys = $AssetsKeysGen();
  static const $AssetsSvgsGen svgs = $AssetsSvgsGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

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

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
