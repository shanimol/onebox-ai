// import 'dart:ui';
//
// import 'package:flutter/material.dart';
//
//
// class TransparentLoader extends StatelessWidget {
//   final bool isLoading;
//
//   const TransparentLoader({super.key, required this.isLoading});
//
//   @override
//   Widget build(BuildContext context) {
//     return AbsorbPointer(
//       absorbing: isLoading == true,
//       child: Visibility(
//         visible: isLoading == true,
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
//           child: LoadingIndicator(),
//         ),
//       ),
//     );
//   }
// }
