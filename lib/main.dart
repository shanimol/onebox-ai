import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexus/gen/fonts.gen.dart';

import 'app/common/util/initializer.dart';
import 'app/routes/app_pages.dart';

void main() {
  Initializer.instance.init(
    () async {
      runApp(
        GetMaterialApp(
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: FontFamily.iBMPlexSans,
          ),
        ),
      );
    },
  );
}
