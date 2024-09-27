// import 'dart:math';
//
// import 'package:infinyte/app/common/config/flavor_config.dart';
// import 'package:infinyte/app/common/service/exchange_rate_fetch_service.dart';
// import 'package:infinyte/app/common/service/storage_service.dart';
// import 'package:infinyte/app/common/translations/strings.dart';
// import 'package:infinyte/app/common/util/translations_util.dart';
// import 'package:infinyte/app/common/util/utils.dart';
// import 'package:infinyte/app/data/models/currency/conversion_rate.dart';
// import 'package:infinyte/app/data/models/currency/currency.dart';
// import 'package:intl/intl.dart';
// import 'package:money2/money2.dart';
//
// class StringUtils {
//   StringUtils._();
//
//   static String enumName(String enumToString) {
//     List<String> paths = enumToString.split('.');
//     return paths[paths.length - 1];
//   }
//
//   static String getURL([String? url]) {
//     if (url == null) {
//       return FlavorConfig.instance!.values.baseUrl;
//     }
//
//     return '${FlavorConfig.instance!.values.baseUrl}$url';
//   }
//
// //coverts the duration in to text as we required
// // Input: "42:25:29.584000"
// //Output: "3 Days 18 Hours 5 Minutes left"
//   static String createDateTextFromDuration(Duration diff) {
//     String text = "";
//     Duration remainingDuration = diff;
//     if (remainingDuration.inDays >= 2) {
//       text +=
//           "${remainingDuration.inDays} ${Intl.plural(remainingDuration.inDays, one: "day", other: "days")}";
//       remainingDuration -= Duration(days: remainingDuration.inDays);
//     } else if (remainingDuration.inHours > 0) {
//       if (text.isNotEmpty) {
//         text += " : ";
//       }
//       text +=
//           "${(remainingDuration.inHours < 10 ? "0" : "") + remainingDuration.inHours.toString()} ${Intl.plural(remainingDuration.inHours, one: "hour", other: "hours")}";
//       remainingDuration -= Duration(hours: remainingDuration.inHours);
//     } else if (remainingDuration.inMinutes > 0) {
//       if (text.isNotEmpty) {
//         text += " : ";
//       }
//       text +=
//           "${(remainingDuration.inMinutes < 10 ? "0" : "") + remainingDuration.inMinutes.toString()} ${Intl.plural(remainingDuration.inMinutes, one: "min", other: "mins")}";
//     }
//     if (text != "") {
//       text = "Closes in $text";
//     }
//     return text.trim();
//   }
//
//   /// Function to add suffix to a given date of month
//   static String getDayOfMonthSuffix(int dayNum) {
//     if (!(dayNum >= 1 && dayNum <= 31)) {
//       throw Exception('Invalid day of month');
//     }
//
//     if (dayNum >= 11 && dayNum <= 13) {
//       return 'th';
//     }
//
//     switch (dayNum % 10) {
//       case 1:
//         return 'st';
//       case 2:
//         return 'nd';
//       case 3:
//         return 'rd';
//       default:
//         return 'th';
//     }
//   }
//
//   static String createTimeLeftTextFromDuration(Duration remainingDuration,
//       {bool isSingleLetter = true}) {
//     String text = "";
//     if (remainingDuration.inDays > 0) {
//       text +=
//           "${remainingDuration.inDays} ${isSingleLetter ? "d" : Intl.plural(remainingDuration.inDays, one: "day", other: "days")}";
//       remainingDuration -= Duration(days: remainingDuration.inDays);
//     } else if (remainingDuration.inHours > 0) {
//       text +=
//           "${remainingDuration.inHours} ${isSingleLetter ? "h" : Intl.plural(remainingDuration.inHours, one: "hour", other: "hours")}";
//       remainingDuration -= Duration(hours: remainingDuration.inHours);
//     }
//     if (text != "") {
//       text += " left";
//     }
//     return text.trim();
//   }
//
//   static String createTimeLeftTextFromDurationInHoursAndMinutes(
//     Duration remainingDuration,
//   ) {
//     String text = "";
//
//     if (remainingDuration.inHours > 0 && remainingDuration.inMinutes % 60 > 0) {
//       text +=
//           "${remainingDuration.inHours} ${Intl.plural(remainingDuration.inHours, one: "hour", other: "hours")}, ${remainingDuration.inMinutes % 60} ${Intl.plural(remainingDuration.inMinutes % 60, one: "min", other: "mins")}";
//     } else if (remainingDuration.inHours > 0 &&
//         remainingDuration.inMinutes % 60 == 0) {
//       text +=
//           "${remainingDuration.inHours} ${Intl.plural(remainingDuration.inHours, one: "hour", other: "hours")}";
//     } else if (remainingDuration.inHours <= 0 &&
//         remainingDuration.inMinutes > 0) {
//       text +=
//           "${remainingDuration.inMinutes} ${Intl.plural(remainingDuration.inMinutes, one: "min", other: "mins")}";
//     } else if (remainingDuration.inHours <= 0 &&
//         remainingDuration.inMinutes <= 0) {
//       text += "0 min";
//     }
//     if (text != "") {
//       text += " left";
//     }
//     return text.trim();
//   }
//
//   static ClubCurrency getBaseCurrencyValue() {
//     ConversionRate conversionRate = StorageService.box.getConversionRates() ??
//         ExchangeRateFetchService.fetchService.substituteConversionRate;
//     return conversionRate.rates.firstWhere(
//       (element) => element.currency == conversionRate.base,
//     );
//   }
//
//   static String amountInINRToAmountString(
//     BigInt amount, {
//     bool shouldShowCurrencySymbol = false,
//     bool shouldSuffixAmount = true,
//     bool shouldShowDecimal = true,
//   }) {
//     Money money =
//         Money.fromBigInt(amount, code: getBaseCurrencyValue().currency.name);
//     return numberToAmountString(
//       money,
//       shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//       shouldSuffixAmount: shouldSuffixAmount,
//       shouldShowDecimal: shouldShowDecimal,
//     );
//   }
//
//   ///This function is used to convert a given amount to amount in a particular currency.
//   ///It accepts a convertCurrency data(currency name and conversion rate), amount and the baseCurrency data of the given amount.
//   ///It converts the given amount to equivalent amount in the convertCurrency using the above data.
//   static String numberToAmountString(
//     Money amount, {
//     ClubCurrency? baseCurrency,
//     ClubCurrency? convertCurrency,
//     bool shouldShowCurrencySymbol = false,
//     bool shouldSuffixAmount = true,
//     bool shouldShowDecimal = true,
//   }) {
//     ClubCurrency convertCurrencyValue =
//         convertCurrency ?? getBaseCurrencyValue();
//     amount = Money.fromBigInt(
//         Utils.convertCurrency(
//           amount: amount,
//           baseCurrency: baseCurrency ?? getBaseCurrencyValue(),
//           convertCurrency: convertCurrencyValue,
//         ),
//         code: convertCurrencyValue.currency.name);
//     if (shouldSuffixAmount) {
//       if ((convertCurrencyValue.currency) == ClubCurrencyCode.INR) {
//         return inrConversion(
//           amount,
//           shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//           shouldShowDecimal: shouldShowDecimal,
//         );
//       } else if (convertCurrencyValue.currency == ClubCurrencyCode.USD) {
//         return usdConversion(
//           amount,
//           shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//           shouldShowDecimal: shouldShowDecimal,
//         );
//       }
//       return inrConversion(
//         amount,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//         shouldShowDecimal: shouldShowDecimal,
//       );
//     } else {
//       return "${shouldShowCurrencySymbol ? amount.currency.symbol : ''}${thousandConversion(
//         amount.amount.toString(),
//         shouldShowDecimal: shouldShowDecimal,
//       )}";
//     }
//   }
//
//   ///This function will convert given amount into amounts in 1000s(K) and 1000000s(M) as per US standards
//   static String usdConversion(
//     Money amount, {
//     bool shouldShowCurrencySymbol = false,
//     bool shouldShowDecimal = true,
//   }) {
//     if (amount.minorUnits < BigInt.from(100000)) {
//       return decimalOrFraction(
//         amount,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//         shouldShowDecimal: shouldShowDecimal,
//       );
//     } else if (BigInt.from(100000) <= amount.minorUnits &&
//         amount.minorUnits < BigInt.from(100000000)) {
//       amount = (amount / 1000);
//       return "${decimalOrFraction(
//         amount,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//         shouldShowDecimal: shouldShowDecimal,
//       )}K";
//     } else {
//       amount = (amount / 1000000);
//       return "${decimalOrFraction(
//         amount,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//         shouldShowDecimal: shouldShowDecimal,
//       )}M";
//     }
//   }
//
//   static String inrConversionAmountInWords(
//     Money amount, {
//     bool shouldShowCurrencySymbol = false,
//     bool shouldShowDecimal = false,
//     bool shouldSuffixAmount = false,
//   }) {
//     if (amount.minorUnits >= BigInt.from(1000000000)) {
//       amount = amount / (10000000);
//       return "${decimalOrFraction(
//         amount,
//         shouldShowDecimal: shouldShowDecimal,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//       )} Crore";
//     } else if (amount.minorUnits >= BigInt.from(10000000)) {
//       amount = amount / (100000);
//       return "${decimalOrFraction(
//         amount,
//         shouldShowDecimal: shouldShowDecimal,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//       )} Lakh";
//     } else {
//       return decimalOrFraction(
//         amount,
//         shouldShowDecimal: shouldShowDecimal,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//       );
//     }
//   }
//
//   ///This function will convert given amount into amounts in 1000s(K), 100000s(L) and 10000000s(Cr) as per Indian standards
//   static String inrConversion(
//     Money amount, {
//     bool shouldShowCurrencySymbol = false,
//     bool shouldShowDecimal = true,
//   }) {
//     if (amount.minorUnits < BigInt.from(100000)) {
//       return decimalOrFraction(
//         amount,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//         shouldShowDecimal: shouldShowDecimal,
//       );
//     } else if (amount.minorUnits < BigInt.from(10000000)) {
//       // less than 1 lakh -> 100K
//       amount = (amount / 1000);
//       return "${decimalOrFraction(
//         amount,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//         shouldShowDecimal: shouldShowDecimal,
//       )}K";
//     } else if (amount.minorUnits < BigInt.from(1000000000)) {
//       // less than 1 lakh -> 100L
//       amount = (amount / 100000);
//       return "${decimalOrFraction(
//         amount,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//         shouldShowDecimal: shouldShowDecimal,
//       )}L";
//     } else {
//       amount = (amount / 10000000);
//       if (amount.minorUnits < BigInt.from(100000)) {
//         return "${decimalOrFraction(
//           amount,
//           shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//           shouldShowDecimal: shouldShowDecimal,
//         )}Cr";
//       } else if (BigInt.from(100000) <= amount.minorUnits &&
//           amount.minorUnits < BigInt.from(10000000)) {
//         amount = (amount / 1000);
//         return "${decimalOrFraction(
//           amount,
//           shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//           shouldShowDecimal: shouldShowDecimal,
//         )}K Cr";
//       } else {
//         amount = (amount / 100000);
//         return "${decimalOrFraction(
//           amount,
//           shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//           shouldShowDecimal: shouldShowDecimal,
//         )}L Cr";
//       }
//     }
//   }
//
//   static Map<String, int> getAmountBaseAndSuffix(Money amount) {
//     if (amount.minorUnits < BigInt.from(100000)) {
//       return {"": 0};
//     } else if (amount.minorUnits < BigInt.from(10000000)) {
//       return {"K": 1000};
//     } else if (amount.minorUnits < BigInt.from(1000000000)) {
//       return {"L": 100000};
//     } else {
//       return {"Cr": 10000000};
//     }
//   }
//
//   static String decimalOrFraction(
//     Money amount, {
//     bool shouldShowCurrencySymbol = false,
//     bool shouldShowDecimal = true,
//   }) {
//     return "${shouldShowCurrencySymbol ? amount.currency.symbol : ''}${amount.decimalPart == BigInt.from(0) || !shouldShowDecimal ? amount.integerPart.toString() : (amount.amount.toDecimal())}";
//   }
//
//   static String thousandConversion(
//     String amount, {
//     bool shouldShowDecimal = true,
//   }) {
//     List<String> intDecimalSplit = amount.split(".");
//     String integerPart;
//     String? decimal;
//     String separator = ",";
//     String newString = '';
//     int counter = 0;
//
//     integerPart = intDecimalSplit[0];
//     if (intDecimalSplit.length > 1) {
//       decimal = intDecimalSplit[1];
//     }
//     for (int i = integerPart.length - 1; i >= 0; i--) {
//       if (counter > 1 && counter % 2 != 0) {
//         newString = separator + newString;
//       }
//       newString = integerPart[i] + newString;
//       counter++;
//     }
//     String formattedString =
//         "$newString${shouldShowDecimal && decimal != null && decimal != "00" ? ".$decimal" : ""}";
//     return formattedString;
//   }
//
//   static String dateDifferenceInDays(DateTime date) {
//     try {
//       var currentTime = Utils.getCurrentTime;
//       Duration diff = currentTime.difference(date);
//
//       switch (diff.inDays) {
//         case 0:
//           return 'Today';
//         case 1:
//           return 'yesterday';
//         default:
//           {
//             var months = (diff.inDays / 30).floor();
//             var years = (months / 12).floor();
//
//             if (years > 0) {
//               return '$years ${Intl.plural(years, one: "year", other: "years")} ago';
//             } else if (months > 0) {
//               return '$months ${Intl.plural(months, one: "month", other: "months")} ago';
//             } else {
//               return '${diff.inDays} days ago';
//             }
//           }
//       }
//     } catch (e) {
//       return '';
//     }
//   }
//
//   static String getRandomString(
//     int length, {
//     bool isNumber = true,
//   }) {
//     final _chars = isNumber ? '1234567890' : 'abcdefghijklmnopqrstuvwxyz';
//     final _rnd = Random();
//
//     return String.fromCharCodes(
//       Iterable.generate(
//         length,
//         (_) => _chars.codeUnitAt(
//           _rnd.nextInt(
//             _chars.length,
//           ),
//         ),
//       ),
//     );
//   }
//
//   static String createTimeLeftTextForDealCard(
//     Duration remainingDuration,
//   ) {
//     String text = "";
//     if (remainingDuration.inDays >= 2) {
//       text += "${remainingDuration.inDays} days left";
//     } else if (remainingDuration.inHours >= 2) {
//       text += "${remainingDuration.inHours} hours left";
//     } else if (remainingDuration.inHours == 1) {
//       text += "1 hour left";
//     } else if (remainingDuration.inMinutes >= 2) {
//       text += "${remainingDuration.inMinutes} minutes left";
//     } else {
//       text += "1 minute left";
//     }
//     return text.trim();
//   }
//
//   static String getOrdinalSuffix(int number) {
//     if (10 <= number % 100 && number % 100 <= 20) {
//       return 'th';
//     } else {
//       int lastDigit = number % 10;
//       switch (lastDigit) {
//         case 1:
//           return 'st';
//         case 2:
//           return 'nd';
//         case 3:
//           return 'rd';
//         default:
//           return 'th';
//       }
//     }
//   }
//
//   static String getMonthName(int month) {
//     // Convert month number to month name
//     const monthNames = [
//       'January',
//       'February',
//       'March',
//       'April',
//       'May',
//       'June',
//       'July',
//       'August',
//       'September',
//       'October',
//       'November',
//       'December'
//     ];
//     return monthNames[month - 1];
//   }
//
//   static String getGreeting(name) {
//     try {
//       DateTime now = DateTime.now();
//       int hour = now.hour;
//
//       if (Strings.localGreetingMessage.translate().isNotEmpty) {
//         return '${Strings.localGreetingMessage.translate()} $name';
//       }
//       if (hour >= 0 && hour < 12) {
//         return '${Strings.goodMorning.translate()} $name!';
//       } else if (hour >= 12 && hour < 18) {
//         return '${Strings.goodAfterNoon.translate()} $name!';
//       } else {
//         return '${Strings.goodEvening.translate()} $name!';
//       }
//     } catch (err) {
//       return Strings.hiUsername.translate(args: [name]);
//     }
//   }
//
//   static String getDomainFromEmail(String email) {
//     List<String> parts = email.split('@');
//     if (parts.length == 2) {
//       return parts[1];
//     }
//     return '';
//   }
//
//   //milestone amount representation
//   static String p2pMileStoneAmountSuffixInWords(
//     BigInt amount, {
//     bool shouldShowDecimal = false,
//     bool shouldShowCurrencySymbol = false,
//   }) {
//     if (amount == BigInt.zero) {
//       return 'NA';
//     }
//     Money money =
//         Money.fromBigInt(amount, code: getBaseCurrencyValue().currency.name);
//
//     if (money.minorUnits >= BigInt.from(1000000000)) {
//       money = money / (10000000);
//       return "${decimalOrFraction(
//         money,
//         shouldShowDecimal: shouldShowDecimal,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//       )} Crore";
//     } else if (money.minorUnits >= BigInt.from(10000000)) {
//       money = money / (100000);
//       return "${decimalOrFraction(
//         money,
//         shouldShowDecimal: shouldShowDecimal,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//       )} Lakh";
//     }
//     //thousands an ten thousands will be represented in numbers(1000, 10000 etc)
//     else {
//       return decimalOrFraction(
//         money,
//         shouldShowDecimal: shouldShowDecimal,
//         shouldShowCurrencySymbol: shouldShowCurrencySymbol,
//       );
//     }
//   }
//
//   static String getWordSuffixForVowelsAndConsonents(String word) {
//     return word.startsWith(RegExp(r'[aeiouAEIOU]')) ? 'an' : 'a';
//   }
// }
