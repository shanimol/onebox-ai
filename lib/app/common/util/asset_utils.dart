import 'dart:math';

import '../values/app_images.dart';

class AssetUtils {
  AssetUtils._();

  static final List<String> avatarUrls = [
    AppImages.avatar1,
    AppImages.avatar2,
    AppImages.avatar3,
    AppImages.avatar4,
    AppImages.avatar5,
    AppImages.avatar6,
    AppImages.avatar7,
    AppImages.avatar8,
    AppImages.avatar9,
    AppImages.avatar10,
    AppImages.avatar11,
    AppImages.avatar12,
    AppImages.avatar13,
    AppImages.avatar14,
  ];
  static final _random = Random();

  static String getRandomAvatar({int? randomIndex}) {
    return avatarUrls[randomIndex ??
        _random.nextInt(
          avatarUrls.length,
        )];
  }

  static int getRandomAvatarIndex() {
    return _random.nextInt(
      avatarUrls.length,
    );
  }
}
