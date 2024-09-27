import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../constants/preferences.dart';

class StorageService extends GetxService {
  static StorageService box = Get.find();
  GetStorage store = GetStorage();

  final securedStore = const FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
    ),
    iOptions: IOSOptions(
      accessibility: KeychainAccessibility.first_unlock,
    ),
  );

  // write storage operations here

  Future<void> saveValueIfNull(String key, dynamic value) =>
      store.writeIfNull(key, value);

  Future<void> saveValue(String key, dynamic value) async =>
      await store.write(key, value);

  Future<void> saveListWithGetStorage(
          String key, List<dynamic> storageValue) async =>
      await store.write(key, jsonEncode(storageValue));

  Future<List<dynamic>> getListWithGetStorage(String key) async =>
      jsonDecode(await store.read(key));

  T? getValue<T>(String key) => store.read<T>(key);

  bool hasData(String key) => store.hasData(key);

  Future<void> removeValue(String key) async => await store.remove(key);

  // Future<void> clearStorage() async {
  //   try {
  //     await securedStore.deleteAll();
  //     return await store.erase();
  //   } catch (e, stacktrace) {
  //     SentryUtils.logEvent(
  //         message: "Secure storage delete error",
  //         params: {"error": e.toString()},
  //         stackTrace: stacktrace);
  //   }
  // }
  //
  // Future<void> clearSecureStorage() async {
  //   try {
  //     return await securedStore.deleteAll();
  //   } catch (e) {
  //     SentryUtils.logEvent(
  //         message: "Secure storage write error",
  //         params: {"error": e.toString()});
  //   }
  // }
  //
  // Future<void> clearUserdefault() async {
  //   return store.erase();
  // }
  //
  // Future<void> storeUserDetails(User user) async {
  //   if (user.invitedBy != null) {
  //     storeInvited(user.invitedBy!);
  //   }
  //   storeUserInvestedDealCount(user);
  //   await store.write(
  //     Preferences.userDetails,
  //     user.toMap(),
  //   );
  // }
  //
  // Future<void> storeUserScreeningStatus(User? user) async {
  //   if (user != null) {
  //     await store.write(
  //       Preferences.userScreeningStatus,
  //       user.toMap(),
  //     );
  //   }
  // }
  //
  // void storeUserInvestedDealCount(User user) async {
  //   await store.write(
  //     Preferences.investedDealsCount,
  //     user.investedDeals?.length ?? 0,
  //   );
  // }
  //
  // int getUserInvestedDealCount() {
  //   return store.read(
  //         Preferences.investedDealsCount,
  //       ) ??
  //       0;
  // }
  //
  // void storeInvited(User inviter) {
  //   store.write(
  //     Preferences.inviter,
  //     inviter.toMap(),
  //   );
  // }
  //
  // String getWaitlistFormUrl() {
  //   String url = StorageService.box.getValue(Preferences.waitlistFormUrl) ?? '';
  //   return url.isNotEmpty ? url : Strings.waitlistFormUrl.translate();
  // }
  //
  // Future<void> storeCountryDetails(SearchCountryResponseDTO countryData) async {
  //   await store.write(
  //     Preferences.countryDeatils,
  //     SearchCountryResponseDTO.encode(countryData.result),
  //   );
  // }
  //
  // List<Country>? getCountryDetails() {
  //   String countryDetails = store.read(Preferences.countryDeatils);
  //   return SearchCountryResponseDTO.decode(countryDetails);
  // }
  //
  // User? getInviter() {
  //   Map<String, dynamic>? inviter = store.read(
  //     Preferences.inviter,
  //   );
  //   return inviter == null ? null : User.fromMap(inviter);
  // }
  //
  // Future<void> storeConversionRates(ConversionRate conversionRates) async {
  //   await store.write(
  //     Preferences.conversionRate,
  //     conversionRates.toMap(),
  //   );
  // }
  //
  // ConversionRate? getConversionRates() {
  //   if (store.hasData(Preferences.conversionRate)) {
  //     return ConversionRate.fromMap(
  //       store.read(
  //         Preferences.conversionRate,
  //       ),
  //     );
  //   }
  //   return null;
  // }
  //
  // // conversionRate = StorageService.box.getConversionRates();
  //
  // ClubCurrency getBaseCurrency() {
  //   try {
  //     var conversionRate = ConversionRate.fromMap(
  //       store.read(
  //         Preferences.conversionRate,
  //       ),
  //     );
  //
  //     var baseCurrency = conversionRate.rates.firstWhere(
  //       (element) => element.currency == conversionRate.base,
  //     );
  //
  //     return baseCurrency;
  //   } catch (e) {
  //     return StringUtils.getBaseCurrencyValue();
  //   }
  // }
  //
  // User? getUserDetails() {
  //   Map<String, dynamic>? userDetails = store.read(Preferences.userDetails);
  //   if (userDetails != null) {
  //     return User.fromMap(userDetails);
  //   }
  //   return null;
  // }
  //
  // bool? isInvestorAccreditationUpdated(String aifId) {
  //   return getUserDetails()?.aifConfigurations?.any((element) =>
  //       element.aifId == aifId && element.investorAccreditation != null);
  // }
  //
  // Future<void> updateUserInvestorAccreditation(
  //     InvestorAccreditation investorAccreditation) async {
  //   User? user = getUserDetails();
  //   if (user != null) {
  //     user = user.copyWith(investorAccreditation: investorAccreditation);
  //     await storeUserDetails(user);
  //   }
  // }
  //
  // Future<void> updateUserMultiplayerStatus(
  //     {required bool multiplayerStatus}) async {
  //   User? user = getUserDetails();
  //   if (user != null) {
  //     user = user.copyWith(
  //         userMutualFundConfig: user.userMutualFundConfig
  //             ?.copyWith(isMultiplayerEnabled: multiplayerStatus));
  //     await storeUserDetails(user);
  //   }
  // }
  //
  // Future<void> updateUserAifInvestorAccreditation(
  //     InvestorAccreditation investorAccreditation, String aifId) async {
  //   User? user = getUserDetails();
  //   if (user != null) {
  //     if (user.aifConfigurations == null) {
  //       user = user.copyWith(aifConfigurations: [
  //         UserAifConfiguration(
  //             investorAccreditation: investorAccreditation, aifId: aifId)
  //       ]);
  //     } else {
  //       user.aifConfigurations?.add(UserAifConfiguration(
  //           investorAccreditation: investorAccreditation, aifId: aifId));
  //     }
  //
  //     await storeUserDetails(user);
  //   }
  // }
  //
  // Future<void> updateUserKYCIdentity(KYCIdentity kycIdentity) async {
  //   User? user = getUserDetails();
  //   if (user != null) {
  //     user = user.copyWith(kycIdentity: kycIdentity);
  //     await storeUserDetails(user);
  //   }
  // }
  //
  // Future<void> updateUserPanAndPhoneNumber({String? pan, String? phone}) async {
  //   User? user = getUserDetails();
  //   if (user != null) {
  //     user = user.copyWith(
  //         userMutualFundConfig: user.userMutualFundConfig?.copyWith(
  //       pan: pan,
  //       mobileNumber: phone,
  //     ));
  //     await storeUserDetails(user);
  //   }
  // }
  //
  Future<void> storeToken({String? accessToken, String? refreshToken}) async {
    if (accessToken != null && refreshToken != "") {
      try {
        await securedStore.write(
          key: Preferences.accessToken,
          value: accessToken,
        );
        await securedStore.write(
          key: Preferences.refreshToken,
          value: refreshToken,
        );
      } catch (e) {}
    }
  }

  //
  Future<String?> getAuthToken() async {
    try {
      return await securedStore.read(
        key: Preferences.accessToken,
      );
    } catch (e) {
      return null;
    }
  }

  //
  // Future<bool> hasAuthToken() async {
  //   try {
  //     var token = await securedStore.read(
  //       key: Preferences.accessToken,
  //     );
  //     return token != null && token.isNotEmpty;
  //   } catch (e) {
  //     return false;
  //   }
  // }
  //
  Future<String?> getRefreshToken() async {
    try {
      return await securedStore.read(
        key: Preferences.refreshToken,
      );
    } catch (e) {
      return null;
    }
  }
  //
  // Future<bool> hasRefreshToken() async {
  //   try {
  //     return await securedStore.containsKey(
  //       key: Preferences.refreshToken,
  //     );
  //   } catch (e) {
  //     return false;
  //   }
  // }
  //
  // Future<bool> isLoggedIn() async {
  //   try {
  //     return await securedStore.containsKey(
  //       key: Preferences.accessToken,
  //     );
  //   } catch (e) {
  //     SentryUtils.logEvent(
  //         message: "Secure storage isLogged-in error",
  //         params: {"error": e.toString()});
  //     return false;
  //   }
  // }
  //
  // Map<String, dynamic> getConfiguration() {
  //   return {
  //     Preferences.privacyPolicy: store.read(Preferences.privacyPolicy),
  //     Preferences.insiderTermsOfUse: store.read(Preferences.insiderTermsOfUse),
  //     Preferences.reachOutWhatsapp: store.read(Preferences.reachOutWhatsapp),
  //     Preferences.userBiometricDisableThreshold:
  //         store.read(Preferences.userBiometricDisableThreshold),
  //     Preferences.isBiometricEnabled:
  //         store.read(Preferences.isBiometricEnabled),
  //   };
  // }
  //
  // void storeConfiguration(Map<String, dynamic> configuration) {
  //   configuration.forEach(
  //     (key, value) {
  //       store.write(key, value);
  //     },
  //   );
  // }
  //
  // void setSyndicateDealApprovalMessage(Map<String, dynamic> messageToLPsMap) {
  //   StorageService.box.saveValue(
  //     Preferences.messageToLPs,
  //     messageToLPsMap,
  //   );
  // }
  //
  // void setFounderDealApprovalMessage(
  //     Map<String, dynamic> messageToInvestorsMap) {
  //   StorageService.box.saveValue(
  //     Preferences.messageToInvestors,
  //     messageToInvestorsMap,
  //   );
  // }
  //
  // Map<String, dynamic> getSyndicateDealApprovalMessages() {
  //   return StorageService.box.getValue(Preferences.messageToLPs) ??
  //       <String, dynamic>{};
  // }
  //
  // Map<String, dynamic> getFounderDealApprovalMessages() {
  //   return StorageService.box.getValue(Preferences.messageToInvestors) ??
  //       <String, dynamic>{};
  // }
  //
  // void setUserAccessMode(AccessMode? mode) {
  //   box.saveValue(Preferences.userAccessMode, mode?.name);
  // }
  //
  // AccessMode getUserAccessMode() {
  //   return AccessMode.fromJson(
  //       box.getValue(Preferences.userAccessMode) as String?);
  // }
  //
  // void setIsUserIdentified() {
  //   box.saveValue(Preferences.isUserIdentified, true);
  // }
  //
  // bool isUserIdentified() {
  //   return box.getValue(Preferences.isUserIdentified) ?? false;
  // }
  //
  // bool isUserLoggedInCleverTap() {
  //   return box.getValue(Preferences.isUserLoggedInCleverTap) ?? false;
  // }
  //
  // void setIsUserLoggedInCleverTap() {
  //   box.saveValue(Preferences.isUserLoggedInCleverTap, true);
  // }
  //
  // void setIsBiometricPermissionGranted() {
  //   saveValue(Preferences.isBiometricPermissionGranted, true);
  // }
  //
  // bool isBiometricPermissionGranted() {
  //   return getValue(Preferences.isBiometricPermissionGranted) as bool? ?? false;
  // }
  //
  // void updateBiometricDismissCount() async {
  //   int currentCount =
  //       box.getValue(Preferences.biometricActivateDismissedCount) ?? 0;
  //   int userBiometricDisableThreshold = int.parse(
  //       box.getValue(Preferences.userBiometricDisableThreshold) ?? '2');
  //   if (currentCount + 1 >= userBiometricDisableThreshold) {
  //     box.saveValue(Preferences.isBiometricDismissThresholdReached, true);
  //   }
  //   box.saveValue(
  //       Preferences.biometricActivateDismissedCount, currentCount + 1);
  // }
  //
  // bool getIsBiometricDismissThresholdReached() {
  //   return box.getValue(Preferences.isBiometricDismissThresholdReached) ??
  //       false;
  // }
  //
  // bool isBiometricEnabled() {
  //   return (box.getValue(Preferences.isBiometricEnabled) as String?)
  //           ?.parseBool() ??
  //       true;
  // }
  //
  // bool isUserVerified() {
  //   return box.getValue(Preferences.isUserVerified) ?? false;
  // }
  //
  // void setUserVerified() {
  //   box.saveValue(
  //     Preferences.isUserVerified,
  //     true,
  //   );
  // }
  //
  // void setInviteTokenAndType({String? inviteToken, String? inviteType}) {
  //   if (inviteToken != null && inviteToken != "") {
  //     saveValue(Preferences.inviteToken, inviteToken);
  //     saveValue(Preferences.inviteType, inviteType);
  //   }
  // }
  //
  // String? getInviteToken() {
  //   return getValue(Preferences.inviteToken) as String? ?? "";
  // }
  //
  // InviteType? getInviteType() {
  //   String? inviteType = getValue(Preferences.inviteType) as String? ?? "";
  //
  //   return InviteType.fromJson(inviteType);
  // }
  //
  // bool hasVerificationAnimationPlayed() {
  //   return box.getValue(Preferences.hasVerificationAnimationPlayed) ?? false;
  // }
  //
  // void setHasVerificationAnimationPlayed() {
  //   box.saveValue(
  //     Preferences.hasVerificationAnimationPlayed,
  //     true,
  //   );
  // }
  //
  // Future<ClubProduct?> getClubProduct(String productName) async {
  //   try {
  //     final productJsonList = await getListWithGetStorage(ApiQuery.products);
  //     final productList = await compute(
  //       Utils.extractClassListFromJson<ClubProduct>,
  //       productJsonList,
  //     );
  //     return productList.firstWhereOrNull(
  //       (element) => element.name == productName,
  //     );
  //   } catch (e) {
  //     return null;
  //   }
  // }
  //
  // void setP2pPlan(Plan plan) {
  //   box.saveValue(
  //     Preferences.selectedP2pLendingPlan,
  //     plan.toMap(),
  //   );
  // }
  //
  // Plan? getSelectedP2pPlan() {
  //   try {
  //     return Plan.fromMap(
  //       box.getValue(Preferences.selectedP2pLendingPlan),
  //     );
  //   } catch (e) {
  //     return null;
  //   }
  // }
  //
  // void setFirstFoldAnimationCount(int count) {
  //   box.saveValue(
  //     Preferences.firstFoldAnimationCount,
  //     count,
  //   );
  // }
  //
  // int? getFirstFoldAnimationCount() {
  //   return box.getValue(Preferences.firstFoldAnimationCount);
  // }
  //
  // Future<void> updateUserP2POnboardingStatus(P2PProfile? p2pProfile) async {
  //   User? user = getUserDetails();
  //   if (user != null && p2pProfile != null) {
  //     user.p2pProfile = user.p2pProfile?.copyWith(
  //           p2pKYCStatus: p2pProfile.p2pKYCStatus,
  //         ) ??
  //         p2pProfile;
  //     await storeUserDetails(user);
  //   }
  // }
  //
  // Future<void> updateUserP2PKYCAccepted() async {
  //   User? user = getUserDetails();
  //   if (user != null) {
  //     user.p2pProfile = user.p2pProfile?.copyWith(
  //           kycAccepted: true,
  //         ) ??
  //         P2PProfile(
  //           kycAccepted: true,
  //         );
  //     await storeUserDetails(user);
  //   }
  // }
  //
  // Future<void> updateUserEquityKYCAccepted() async {
  //   User? user = getUserDetails();
  //   if (user != null) {
  //     user.equityProfile = user.equityProfile?.copyWith(
  //           investmentAccepted: true,
  //         ) ??
  //         EquityProfile(
  //           investmentAccepted: true,
  //         );
  //     await storeUserDetails(user);
  //   }
  // }
  //
  // BigInt getDefaultInvestmentAmountMultiple() {
  //   // default investmentAmountMultiple is 10000 in paisa
  //   return BigInt.tryParse(
  //           box.getValue(Preferences.defaultInvestmentAmountMultiple) ?? '') ??
  //       BigInt.from(1000000);
  // }
  //
  // int getP2pPollingIntervalInSeconds() {
  //   // default p2pPollingIntervalInSeconds is 1 second
  //   return int.tryParse(
  //           box.getValue(Preferences.p2pPollingIntervalInSeconds) ?? '') ??
  //       1;
  // }
  //
  // int getP2pPollingLimit() {
  //   // default polling try limit is 60
  //
  //   return int.tryParse(box.getValue(Preferences.p2pPollingLimit) ?? '') ?? 60;
  // }
  //
  // BigInt getP2pSliderMinInvestmentAmout() {
  //   // default p2pSliderMinInvestmentAmount is 1 lakh
  //   return BigInt.tryParse(
  //         box.getValue(Preferences.p2pSliderMinInvestmentAmount) ?? '',
  //       ) ??
  //       BigInt.from(10000000);
  // }
  //
  // BigInt getMinBalanceForEquityAccess() {
  //   // default minBalanceForEquityAccess is 1 lakh
  //   return BigInt.tryParse(
  //           box.getValue(Preferences.minBalanceForEquityAccess) ?? '') ??
  //       BigInt.from(10000000);
  // }
  //
  // BigInt getP2pSliderMaxInvestmentAmout() {
  //   // default p2pSliderMinInvestmentAmount is 10 lakh
  //   return BigInt.tryParse(
  //         box.getValue(Preferences.p2pSliderMaxInvestmentAmount) ?? '',
  //       ) ??
  //       BigInt.from(100000000);
  // }
  //
  // BigInt getP2pSliderIncrementAmout() {
  //   // default p2pSliderIncrementAmout is 1 lakh
  //   return BigInt.tryParse(
  //         box.getValue(Preferences.p2pSliderIncrementAmout) ?? '',
  //       ) ??
  //       BigInt.from(10000000);
  // }
  //
  // Future<void> storeP2PProduct(ClubProduct? product) async {
  //   await box.saveValue(
  //     Preferences.p2pProduct,
  //     product?.toMap(),
  //   );
  // }
  //
  // Future<ClubProduct?> getP2PProduct() async {
  //   Map<String, dynamic>? product = box.getValue(Preferences.p2pProduct);
  //   if (product != null) {
  //     return ClubProduct.fromMap(
  //       product,
  //     );
  //   }
  //   return null;
  // }
}
