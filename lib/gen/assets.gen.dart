/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/AI.png
  AssetGenImage get ai => const AssetGenImage('assets/images/AI.png');

  /// File path: assets/images/action_items.png
  AssetGenImage get actionItems =>
      const AssetGenImage('assets/images/action_items.png');

  /// File path: assets/images/add.png
  AssetGenImage get add => const AssetGenImage('assets/images/add.png');

  /// File path: assets/images/assign.png
  AssetGenImage get assign => const AssetGenImage('assets/images/assign.png');

  /// File path: assets/images/delete.png
  AssetGenImage get delete => const AssetGenImage('assets/images/delete.png');

  /// File path: assets/images/excel.png
  AssetGenImage get excel => const AssetGenImage('assets/images/excel.png');

  /// File path: assets/images/expand.png
  AssetGenImage get expand => const AssetGenImage('assets/images/expand.png');

  /// File path: assets/images/filter.png
  AssetGenImage get filter => const AssetGenImage('assets/images/filter.png');

  /// File path: assets/images/gmail.png
  AssetGenImage get gmail => const AssetGenImage('assets/images/gmail.png');

  /// File path: assets/images/search.png
  AssetGenImage get search => const AssetGenImage('assets/images/search.png');

  /// File path: assets/images/send.png
  AssetGenImage get send => const AssetGenImage('assets/images/send.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        ai,
        actionItems,
        add,
        assign,
        delete,
        excel,
        expand,
        filter,
        gmail,
        search,
        send
      ];
}

class Assets {
  Assets._();

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
