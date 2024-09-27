class Messages {
  Messages._();

  static const String IMAGE_UPLOAD_FAILED = "IMAGE_UPLOAD_FAILED";
  static const String SET_DEAL_LAST_VIEWED_FAILED =
      "SET_DEAL_LAST_VIEWED_FAILED";
  static const String USER_STATUS_FETCH_FAILED = "USER_STATUS_FETCH_FAILED";
  static const String SYSTEM_TIME_FETCH_FAILED = "SYSTEM_TIME_FETCH_FAILED";
  static const String APP_SETTINGS_FETCH_FAILED = "APP_SETTINGS_FETCH_FAILED";
  static const String TOKEN_INVALID_ERROR = "Authentication token is invalid";
  static const String UPDATE_DOWNLOAD_FAILED =
      "Cannot update app. Please contact your admin";
  static const String NETWORK_CONNECTION_ERROR =
      "Please check your connection!";
  static const String UPDATE_DOWNLOADING_MESSAGE = "Downloading update";
  static const String BACK_PRESS_MESSAGE = "Press back again to exit";
  static const String LOGIN_FAILED_ERROR = "Failed to login! Please try again.";
  static const String GENERIC_ERROR_MESSAGE =
      "Something went wrong, Please try again!";
  static const String CREATE_PAYMENT_ORDER_FAILED =
      "Unable to start payment, Please try again!";
  static const String GENERIC_ERROR_MESSAGE_WITH_REFRESH =
      "Something went wrong, Please refresh the page!";
  static const String USER_DETAILS_FETCH_FAILED =
      "Unable to fetch user details!";
  static const String USER_DETAILS_UPDATE_FAILED =
      "Update user details failed! Please try again.";
  static const String GENERATE_OTP_FAILED = "Generate otp failed";
  static const String VALIDATE_OTP_FAILED = "Validate otp failed";
  static const String APP_CONFIG_FETCH_FAILED =
      "App configuration fetch failed! Please try again.";
  static const String LAUNCH_SCREEN_CONFIG_FAILED =
      "Launch screen configuration failed";
  static String userDataFetchFailed(String client) =>
      "Unable to fetch data from $client. Try again later.";
  static const String GOOGLE_AUTH_FAILED = "Google Auth Failed";
  static const String DEALS_FETCH_FAILED =
      "Unable to fetch deals. Please try again!";
  static const String DEALS_DETAIL_FETCH_FAILED =
      "Unable to fetch deal details. Please try again!";
  static const String ERR_IFSC_INVALID = "ERR_IFSC_INVALID";
  static const String GET_SYSTEM_TIME_FAILED = "Get System Time Failed";
  static const String CURRENCY_DATA_FETCH_FAILED =
      "Unable to fetch currency data. Please try again!";
  static const String AUTHENTICATION_FAILED =
      "Authentication failed. Please try again!";
  static const String DOWNLOAD_FAILED = "Download failed. Please try again!";
  static const String APPLE_AUTH_FAILED = "Apple Auth Failed";
  static const String APPLE_AUTH_EMAIL_HIDDEN =
      "Apple Auth failed due to proxy email being used";
  static const String ICF_DETAILS_FETCH_FAILED =
      "Failed to fetch ICF details. Please try again!";
  static const String ICF_SIGNING_URL_FETCH_FAILED =
      "Failed to fetch ICF Signing URL. Please try again!";
  static const String DOWNLOAD_ICF_URL_FETCH_FAILED =
      "Failed to fetch ICF download URL. Please try again!";
  static const String GENERATE_UCA_FAILED =
      "Failed to generate UCA. Please try again!";
  static const String GENERATE_DOC_FAILED =
      "Failed to generate document. Please try again!";
  static const String UCA_DETAILS_FETCH_FAILED =
      "Failed to fetch UCA details. Please try again!";
  static const String DOC_DETAILS_FETCH_FAILED =
      "Failed to fetch document. Please try again!";
  static const String SIGN_UCA_FAILED = "Failed to sign UCA. Please try again!";
  static const String SIGN_ICF_FAILED = "Failed to sign ICF. Please try again!";
  static const String SIGN_DOC_FAILED =
      "Failed to sign Document. Please try again!";
  static const String UCA_SIGNING_URL_FETCH_FAILED =
      "Failed to fetch UCA Signing URL. Please try again!";
  static const String DOC_SIGNING_URL_FETCH_FAILED =
      "Failed to fetch Document Signing URL. Please try again!";
  static const String DOWNLOAD_UCA_URL_FETCH_FAILED =
      "Failed to fetch UCA download URL. Please try again!";
  static const String DOWNLOAD_URL_FETCH_FAILED =
      "Failed to fetch download URL. Please try again!";
  static const String INVITE_TOKEN_FETCH_FAILED =
      "Invite Token Fetch Failed! Please Try Again ";
  static const String GET_INSTITUTIONS_FAILED = "Get Institutions Failed";
  static const String DIGILOCKER_URL_FETCH_FAILED =
      "Failed to fetch kyc data. Please try again!";
  static const String KYC_STATUS_FETCH_FAILED =
      "Failed to fetch kyc status. Please try again!";
  static const String KRA_VERIFICATION_FAILED =
      "Failed to fetch kyc data. Proceeding to Manual verification";
  static const String BANK_VERIFICATION_FAILED =
      "Failed to verify your bank account";
  static const String SETTINGS_FETCH_FAILED = "Failed to fetch settings";
  static const String INVALID_URL_MESSAGE = "Invalid profile URL provided!";
  static const String OTP_LIMIT_EXCEEDED =
      "OTP limit exceeded. Please try again after some time.";
  static const String LINK_PHONE_FAILED = "Failed to link phone number!";
  static const String DUPLICATE_PHONE_NUMBER =
      "Phone number already registered!";
  static const String KRA_DETAILS_CONFIRMATION_FAILED =
      "KRA details confirmation failed, please retry";
  static const String KYC_IDENTITITES_FETCH_FAILED =
      "KYC identities fetch failed, please retry";
  static const String KYC_IDENTITITES_UPDATE_FAILED =
      "KYC identity update failed, please retry";
  static const String WATI_CHAT_FETCH_FAILED =
      "Wati chat fetch failed, please retry";
  static const String KYC_NOMINEE_ADD_FAILED =
      "Nominee addition failed, please retry";
  static const String INVALID_KYC_DETAILS = "invalid kyc details ";
  static const String NAME_DOES_NOT_MATCH = "name does not match";
  static const String PAN_ALREADY_USED = "pan number already used";
  static const String INVESTOR_ACCREDITATION_FETCH_FAILED =
      "Investor Accreditation Consent fetch failed.";
  static const String INVESTOR_ACCREDITATION_CONSENT_UPDATE_FAILED =
      "Investor Accreditation Consent update failed.";
  static const String ALLOW_PHONE_NOTIFICATIONS_UPDATE_FAILED =
      "Allow phone notifications preference update failed.";
  static const String DOC_UPLOAD_FAILED =
      "Document upload failed, please try again!";
  static const String ADD_BANK_NRI_FAILED =
      "Failed to add bank details, please try again!";
  static const String ADD_COUNTRY_OF_RESIDENCE_FAILED =
      "Failed to update country of residence, please try again!";
  static const String ADD_TIN_FAILED =
      "Failed to add tax identification number, please trty again!";
  static const String STORAGE_PERMISSION_DENIED =
      "Please enable storage permission from app setting!";
  static const String CAMERA_PERMISSION_DENIED =
      "Please enable camera permission from app setting!";
  static const String NO_BANK_DEFINED = "No Bank defined!";
  static const String INVALID_UTR_ENTERED = "Please enter the correct UTR!";
  static const String PROOF_ALREADY_VERIFIED_BANK_TRANSFER =
      "Proof already verified!";
  static const String PROOF_ALREADY_ENTERED_BANK_TRANSFER =
      "Proof already submitted!";
  static const String DEAL_REVIEW_FAQ_FETCH_FAILED =
      "Deal Review FAQ fetch failed!";
  static const String DEAL_INVITE_FAILED =
      "Failed to invite members! Please try again.";
  static const String SYNDICATES_FETCH_FAILED =
      "Failed to fetch syndicates! Please try again.";
  static const String PAYMENT_METHOD_NOT_SUPPORTED =
      "Payment method is not supported";
  static const String CHARGES_FETCH_FAILED =
      "Failed to fetch transaction charges! Please try again.";
  static const String SEBI_CONSENT_FETCH_FAILED =
      "Failed to fetch SEBI consent! Please try again.";
  static const String UNIT_CERTIFICATE_DETAILS_FETCH_FAILED =
      "Failed to fetch Unit Certificate details. Please try again!";
  static const String LINK_EMAIL_FAILED = "Failed to link email!";
  static const String P2P_INVESTMENT_CREATE_FAILED =
      "Failed to investment. Please try again!";
  static const String P2P_INVESTMENT_ORDER_FETCH_FAILED =
      "Failed to fetch investment order. Please try again!";
  static const String P2P_WITHDRAWAL_CREATE_FAILED =
      "Failed to withdraw investment. Please try again!";
  static const String P2P_WITHDRAWAL_ORDER_FETCH_FAILED =
      "Failed to fetch investment order. Please try again!";
  static const String P2P_FAQ_LIST_FETCH_FAILED =
      "Failed to fetch FAQ list. Please try again!";
  static const String PORTFOLIO_FETCH_FAILED =
      "Failed to fetch portfolio. Please try again!";
  static const String PRODUCTS_FETCH_FAILED =
      "Failed to fetch products. Please try again!";
  static const String P2P_CALCULATE_INTEREST_FAILED =
      "Failed to fetch calculated interest rate. Please try again!";
  static const String P2P_GET_INVESTMENT_ORDER_BY_ID_FAILED =
      "Failed to fetch investment order by id. Please try again!";
  static const String P2P_ASSET_ONBOARDING_FETCH_FAILED =
      "Failed to fetch user data. Please try again!";
  static const String P2P_USER_BANKS_FETCH_FAILED =
      "Failed to fetch user banks. Please try again!";
  static const String P2P_LENDING_PLANS_FETCH_FAILED =
      "Failed to fetch lending plans. Please try again!";
  static const String PRODUCT_KYC_SELECT_FAILED =
      "Failed to set product kyc. Please try again!";
  static const String P2P_GET_WITHDRAWAL_ORDER_BY_ID_FAILED =
      "Failed to fetch withdrawal order by id. Please try again!";
  static const String P2P_DOCUEMNT_URL_FETCH_FAILED =
      "Failed to fetch document. Please try again!";
  static const String P2P_ACCEPT_KYC_FAILED =
      "Failed to accept KYC. Please try again!";
  static const String EQUITY_ACCEPT_KYC_FAILED =
      "Failed to accept KYC. Please try again!";
  static const String ADD_DEMAT_FAILED =
      "Failed to add demat. Please try again!";
  static const String AIF_DOC_DETAILS_FETCH_FAILED =
      "Failed to fetch AIF Document details. Please try again!";
  static const String INVESTMENT_DOC_DETAILS_FETCH_FAILED =
      "Failed to fetch Investment Document details. Please try again!";
  static const String AIF_DOC_SIGNING_FAILED =
      "Failed to sign AIF Document. Please try again!";
  static const String GET_UNIT_CERTIFICATES_FETCH_ERROR =
      'Failed to get unit certificates!';
  static const String CLEVERTAP_INITIALIZATION_ERROR =
      "CleverTap initialization error";
  static const String CLEVERTAP_RECORD_NOTIFICATION_CLICKED_EVENT_ERROR =
      "CleverTap record notification clicked event failed";
  static const String CLEVERTAP_KILLED_STATE_NOTIFICATION_INTERACTION_ERROR =
      "Clevertap killed state notification interaction failed";
  static const String CLEVERTAP_ONUSERLOGIN_FAILED =
      "CleverTap onUserLogin failed";
  static const String CLEVERTAP_PROFILE_UPDATE_FAILED =
      "CleverTap profile update failed";
  static const String LOCAL_PUSH_PRIMER_ERROR = "Local push primer error";
  static const String CLEVERTAP_PUSH_NOTIFICATION_REGISTER_FAILED =
      "CleverTap register for push notification failed";
  static const String CLEVERTAP_RECORD_EVENT_FAILED =
      "CleverTap record event failed";
  static const String SYNC_CONTACTS_FAILED = "Sync contacts failed";
  static const String PROFILE_PICTURE_UPDATE_FAILED =
      "Profile picture update failed";
  static const String EXTERNAL_INVESTMENTS_FETCH_FAILED =
      "Failed to fetch portfolio. Please try again!";
  static const String REFRESH_MUTUAL_FUNDS_FAILED =
      "Failed to refresh portfolio. Please try again!";
  static const String MUTUAL_FUND_INVALID_PAN_NUMBER_ERROR =
      "Enter valid pan number";
  static const String LINK_SCRAPING_FAILED = "Link scraping failed";
  static const String MULTIPLAYER_ACCESS_CODES_FETCH_FAILED =
      "Failed to fetch multiplayer access codes. Please try again!";
  static const String MULTIPLAYER_ACCESS_STATUS_UPDATE_FAILED =
      "Failed to update multiplayer status. Please try again!";
  static const String MULTIPLAYER_ALL_PLAYERS_FETCH_FAILED =
      "Failed to fetch all players. Please try again!";
  static const String MULTIPLAYER_PIN_PLAYERS_FAILED =
      "Failed to pin players. Please try again!";
  static const String MULTIPLAYER_UNPIN_PLAYERS_FAILED =
      "Failed to unpin players. Please try again!";
  static const String MULTIPLIER_STATUS_UPDATION_FAILED =
      "Failed to update multiplier status. Please try again!";
  static const String MULTIPLAYER_UPDATE_PLAYERS_LAST_VIEWED_AT_FAILED =
      "Failed to update players last viewed at. Please try again!";
}
