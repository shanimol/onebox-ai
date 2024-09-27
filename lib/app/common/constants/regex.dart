class AppRegex {
  AppRegex._();

  static RegExp panRegex = RegExp("[A-Z]{5}[0-9]{4}[A-Z]{1}");
  static RegExp alphanumericRegex = RegExp('[A-Z0-9]');
  static RegExp alphanumericWithSmallCaseRegex = RegExp('[A-Za-z0-9]');
  static RegExp numericRegex = RegExp('[0-9]');
  static RegExp ifscRegex = RegExp("^[A-Z]{4}0[A-Z0-9]{6}\$");
  static RegExp alphabetRegex = RegExp('[A-Za-z ]');
  static RegExp maskNumberRegex = RegExp(r'.(?=.{5})');
  static RegExp linkedinUrlRegex = RegExp(
      r"\b(?:https?:\/\/)?(?:www\.)?linkedin\.com\/(?:m\/)?(?:profile\/)?(?:in|pub)\/([a-zA-Z0-9_-]+)(?:\/[a-zA-Z0-9_-]+)?\b");
}
