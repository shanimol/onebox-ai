import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Extensions {}

extension RemoveTrailZeroExt on double {
  String toStringWithoutTrailingZeros() {
    return truncateToDouble() == this ? toInt().toString() : toString();
  }

  //extention to convert double to BigInt
  BigInt toBigInt() {
    return BigInt.from(this) * BigInt.from(100);
  }
}

extension BorderRadiusExt on num {
  BorderRadius get borderRadius => BorderRadius.circular(r);

  InputBorder outlineInputBorder({
    BorderSide borderSide = BorderSide.none,
  }) =>
      OutlineInputBorder(
        borderRadius: borderRadius,
        borderSide: borderSide,
      );

  BorderSide borderSide({
    Color? color,
    double? width,
    BorderStyle? style,
  }) =>
      BorderSide(
        color: color ?? Colors.white,
        width: toDouble(),
        style: style ?? BorderStyle.solid,
      );
}

extension HexColorExt on String {
  Color get fromHex {
    final buffer = StringBuffer();
    if (length == 6 || length == 7) {
      buffer.write('ff');
    }

    if (startsWith('#')) {
      buffer.write(replaceFirst('#', ''));
    }
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

extension ImageExt on String {
  String get image => 'assets/images/$this.png';

  Image imageAsset({
    Size? size,
    BoxFit? fit,
    Color? color,
  }) =>
      Image.asset(
        this,
        color: color,
        width: size?.width,
        height: size?.height,
        fit: fit,
      );
}

extension AlignWidgetExt on Widget {
  Widget align({
    Alignment alignment = Alignment.center,
  }) =>
      Align(
        alignment: alignment,
        child: this,
      );
}

extension FormatDurationExt on int {
  String formatDuration() {
    final min = this ~/ 60;
    final sec = this % 60;
    return "${min.toString().padLeft(2, "0")}:${sec.toString().padLeft(2, "0")} min";
  }
}

extension DebugLog on String {
  void debugLog() {
    return debugPrint(
      '\n******************************* DebugLog *******************************\n'
      ' $this'
      '\n******************************* DebugLog *******************************\n',
      wrapWidth: 1024,
    );
  }
}

extension E on String {
  String lastChars(int n) => substring(length - n);
}

extension NonBreakingSpace on String {
  String get nonBreaking => replaceAll(' ', String.fromCharCode(0x00A0));
}

extension BoolParsing on String {
  bool parseBool() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    }
    return false;
  }
}

extension NumberToString on num {
  String toClubStringAsFixed(int noOfDecimalPoints) {
    ///If the amount is a whole number, remove the decimal
    if (this == 0) {
      return '0.0';
    } else if ((this % 1) == 0) {
      return toInt().toString();
    } else {
      return toStringAsFixed(noOfDecimalPoints);
    }
  }

  num toNumberPrecision(int n) {
    if ((this % 1) == 0) {
      return toInt();
    } else {
      return num.parse(toStringAsFixed(n));
    }
  }

  bool isWholeNumber() => ((this % 1) == 0);
}

extension FirstElementExtension on List<dynamic> {
  String? get firstElement {
    return isEmpty ? null : this[0];
  }
}

extension StringNullOrEmptyCheck on String? {
  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }
}

extension ListSeparate<T> on List<T> {
  List<T> separate(T element) {
    List<T> result = [];

    for (int i = 0; i < length; i++) {
      result.add(this[i]);

      if (i < length - 1) {
        result.add(element);
      }
    }

    return result;
  }
}

extension ListWithLast<T> on List<T> {
  List<T> withLast(T element) {
    List<T> result = List.from(this);
    result.add(element);

    return result;
  }
}

extension SafeAccess<T> on List<T> {
  T? safeGet(int index) {
    if (index >= 0 && index < length) {
      return this[index];
    }
    return null;
  }
}

extension ListIndexedMap<T1> on List<T1> {
  List<T2> indexedMap<T2>(T2 Function(T1, int) callback) {
    List<T2> result = [];

    for (int i = 0; i < length; i++) {
      result.add(callback(this[i], i));
    }

    return result;
  }
}

extension GenericFirstElementExtension on List<dynamic> {
  dynamic get genericFirstElement {
    return isEmpty ? null : this[0];
  }
}

extension EitherExtension<L, R> on Either<L, R> {
  R? getRight() {
    return fold((_) => null, (right) => right);
  }
}
// extension doublePrecision on double {
//   double toDoublePrecision(int n) => double.parse(toStringAsFixed(2));
// }

// (total ~/ BigInt.from(100)).toDouble()
