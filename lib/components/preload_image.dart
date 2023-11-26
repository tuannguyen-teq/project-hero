import 'package:common/common.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:async';

Gradient getRadialGradient() {
  return const RadialGradient(
    colors: [
      AppColors.whiteFFFFFF,
      AppColors.greenE4F4F7,
    ],
  );
}

// Future<void> preloadImageApp() async {
//   final Completer<void> completer = Completer();
//   await loadImage(const AssetImage(AppImages.iconUserHero));
//   await precachePicture(
//       ExactAssetPicture(SvgPicture.svgStringDecoderOutsideViewBoxBuilder, AppImages.imgBuilding),
//       null);
//   completer.complete();
//   return completer.future;
// }

Future<void> loadImage(ImageProvider provider) {
  final config = ImageConfiguration(
    bundle: rootBundle,
    devicePixelRatio: 1,
    platform: defaultTargetPlatform,
  );
  final Completer<void> completer = Completer();
  final ImageStream stream = provider.resolve(config);

  late final ImageStreamListener listener;

  listener = ImageStreamListener((ImageInfo image, bool sync) {
    completer.complete();
    stream.removeListener(listener);
  }, onError: (dynamic exception, StackTrace? stackTrace) {
    completer.complete();
    stream.removeListener(listener);
    FlutterError.reportError(FlutterErrorDetails(
      context: ErrorDescription('image failed to load'),
      library: 'image resource service',
      exception: exception,
      stack: stackTrace,
      silent: true,
    ));
  });

  stream.addListener(listener);
  return completer.future;
}
