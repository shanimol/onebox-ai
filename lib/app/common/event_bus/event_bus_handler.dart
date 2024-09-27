import 'dart:async';

class EventBusSubscriptionHandler {
  ///Home deals event subscriptions
  StreamSubscription? userCommitedInEventSubscription;
  StreamSubscription? userUpdatedOrderEventSubscription;
  StreamSubscription? screeningRequestEventSubscription;
  StreamSubscription? userInvestedInEventEventSubscription;
  StreamSubscription? dealSoldNotifyEventSubscription;
  StreamSubscription? inviteAccessEventSubscription;
  StreamSubscription? inviteSuccessEventSubscription;
  StreamSubscription? userIOAEsignedEventSubscription;
  StreamSubscription? userSignedEventSubscription;
  StreamSubscription? userUCAEsignedEventSubscription;
  StreamSubscription? userPPMAcceptedEventSubscription;
  StreamSubscription? userUCAAddendumEsignedEventSubscription;
  StreamSubscription? paymentOrderCreatedEventSubscription;
  StreamSubscription? paymentOrderUserConfirmedEvent;
  StreamSubscription? esignCompletedEventSubscription;
  StreamSubscription? syndicateDealApproveSuccessEventSubscription;
  StreamSubscription? syndicateDealRemoveSuccessEventSubscription;
  StreamSubscription? secondaryUserCommitmentEventSubscription;
  StreamSubscription? portfolioTabBarEventSubscription;
  StreamSubscription? profileImageUpdatedEventSubscription;
  StreamSubscription? portfolioTabEventSubscription;
  StreamSubscription? nativeDeeplinkTriggerEventSubscription;
  StreamSubscription? waitlistCommitedtoSubscription;
  StreamSubscription? exploreScrollToTopSubscription;
  StreamSubscription? homeTapEventSubscription;
  StreamSubscription? kycNotDoneUsersPushNotificationEvent;
  StreamSubscription? homePageSectionsDeeplinkNavigationEvent;
  StreamSubscription? giveInviteTriggerEventSubscription;

  ///End

  ///Deal Detail event subsctiptions
  StreamSubscription? userKYCStatusCompleteEventSubscription;
  StreamSubscription? bankTransferUserConfirmdEventSubscription;
  StreamSubscription? bankTransferUserCancelledEventSubscription;
  StreamSubscription? syndicateDealInviteSuccessEventSubscription;
  StreamSubscription? bankTransferPendingVerificationEvent;
  StreamSubscription? ucaDocumentUserSignedEvent;
  StreamSubscription? ioaDocumentUserSignedEvent;
  StreamSubscription? ucaAddendunUserSignedEvent;
  StreamSubscription? kycStatusUpdateEvent;

  ///KYC update event
  StreamSubscription? updateKYCVerificationDataSubscription;
  StreamSubscription? manageTabBarSubscription;

  // esop events
  StreamSubscription? clickEsopTabSubscription;
  StreamSubscription? createPoolSubscription;
  StreamSubscription? editPoolSubscription;
  StreamSubscription? uploadGrantVerificationEventSubscription;
  StreamSubscription? grantVerificationEventSubscription;
  StreamSubscription? addMoreGrantsEventSubscription;

  // Profile events
  StreamSubscription? updateAccountEventSubscription;
  StreamSubscription? esopDeepLinkTriggeredEventSubscription;

  // P2P events
  // StreamSubscription? addNomineeForP2PEventSubscription;
  // StreamSubscription? selectP2PNomineeEventSubscription;
  StreamSubscription? p2PBankVerifiedEventSubscription;
  StreamSubscription? selectP2PBankEventSubscription;
  StreamSubscription? p2PAgreementDocAcceptedEventSubscription;
  StreamSubscription? p2pDeepLinkTriggeredEventSubscription;
  StreamSubscription? p2pOnboardingCompletedEventSubscription;
  StreamSubscription? p2pFuelTabChangeEventSubscription;
  StreamSubscription? esopTabChangeEventSubscription;
  StreamSubscription? p2pWithdrawalFailureEvent;
  StreamSubscription? p2pWithdrawalSuccessEvent;
  StreamSubscription? p2pWithdrawalOrderCreatedEvent;
  StreamSubscription? p2pInvestmentSuccessEvent;
  StreamSubscription? p2pRefreshEvent;
  StreamSubscription? p2pOrderCreatedEvent;
  StreamSubscription? p2pOrderUpdateEvent;
  StreamSubscription? equityKYCAcceptedEvent;
  StreamSubscription? equityKYCAccmfeptedEvent;
  StreamSubscription? mutualFundFetchSuccessEvent;
  StreamSubscription? esopPoolViewDeeplinkTrigeredEvent;
  StreamSubscription? esopPoolViewNavigationEvent;
  StreamSubscription? mutualFundPortfolioTabChangeEvent;
  StreamSubscription? mutualFundDeepLinkTriggeredEventSubscription;
  StreamSubscription? mutualFundDeepLinkMultiplayerEventSubscription;
  StreamSubscription? mutualFundJobStatusUpdateEventSubscription;

  /// Mutual fund events
  StreamSubscription? mutualFundPlayerPinnedEventSubscription;
  StreamSubscription? mutualFundPlayerUnpinnedEventSubscription;
  StreamSubscription? refreshMutualFundEventSubscription;

  void clearEventSubscriptions() {
    homePageSectionsDeeplinkNavigationEvent?.cancel();
    userCommitedInEventSubscription?.cancel();
    userUpdatedOrderEventSubscription?.cancel();
    userInvestedInEventEventSubscription?.cancel();
    inviteAccessEventSubscription?.cancel();
    inviteSuccessEventSubscription?.cancel();
    userIOAEsignedEventSubscription?.cancel();
    userUCAEsignedEventSubscription?.cancel();
    paymentOrderCreatedEventSubscription?.cancel();
    paymentOrderUserConfirmedEvent?.cancel();
    esignCompletedEventSubscription?.cancel();
    userUpdatedOrderEventSubscription?.cancel();
    userKYCStatusCompleteEventSubscription?.cancel();
    bankTransferUserConfirmdEventSubscription?.cancel();
    bankTransferUserCancelledEventSubscription?.cancel();
    syndicateDealApproveSuccessEventSubscription?.cancel();
    syndicateDealRemoveSuccessEventSubscription?.cancel();
    syndicateDealInviteSuccessEventSubscription?.cancel();
    bankTransferPendingVerificationEvent?.cancel();
    paymentOrderCreatedEventSubscription?.cancel();
    esignCompletedEventSubscription?.cancel();
    ucaDocumentUserSignedEvent?.cancel();
    ioaDocumentUserSignedEvent?.cancel();
    paymentOrderUserConfirmedEvent?.cancel();
    ucaAddendunUserSignedEvent?.cancel();
    userUCAAddendumEsignedEventSubscription?.cancel();
    userPPMAcceptedEventSubscription?.cancel();
    secondaryUserCommitmentEventSubscription?.cancel();
    updateKYCVerificationDataSubscription?.cancel();
    kycStatusUpdateEvent?.cancel();
    nativeDeeplinkTriggerEventSubscription?.cancel();
    manageTabBarSubscription?.cancel();
    esopTabChangeEventSubscription?.cancel();
    waitlistCommitedtoSubscription?.cancel();
    exploreScrollToTopSubscription?.cancel();
    homeTapEventSubscription?.cancel();
    dealSoldNotifyEventSubscription?.cancel();
    clickEsopTabSubscription?.cancel();
    createPoolSubscription?.cancel();
    editPoolSubscription?.cancel();
    uploadGrantVerificationEventSubscription?.cancel();
    grantVerificationEventSubscription?.cancel();
    addMoreGrantsEventSubscription?.cancel();
    portfolioTabBarEventSubscription?.cancel();
    portfolioTabEventSubscription?.cancel();
    updateAccountEventSubscription?.cancel();
    profileImageUpdatedEventSubscription?.cancel();
    // addNomineeForP2PEventSubscription?.cancel();
    // selectP2PNomineeEventSubscription?.cancel();
    p2PBankVerifiedEventSubscription?.cancel();
    selectP2PBankEventSubscription?.cancel();
    p2PAgreementDocAcceptedEventSubscription?.cancel();
    p2pDeepLinkTriggeredEventSubscription?.cancel();
    esopDeepLinkTriggeredEventSubscription?.cancel();
    p2pFuelTabChangeEventSubscription?.cancel();
    p2pWithdrawalFailureEvent?.cancel();
    p2pWithdrawalSuccessEvent?.cancel();
    p2pWithdrawalOrderCreatedEvent?.cancel();
    p2pInvestmentSuccessEvent?.cancel();
    p2pRefreshEvent?.cancel();
    p2pOrderCreatedEvent?.cancel();
    p2pOrderUpdateEvent?.cancel();
    equityKYCAcceptedEvent?.cancel();
    screeningRequestEventSubscription?.cancel();
    mutualFundFetchSuccessEvent?.cancel();
    p2pOnboardingCompletedEventSubscription?.cancel();
    giveInviteTriggerEventSubscription?.cancel();
    esopPoolViewDeeplinkTrigeredEvent?.cancel();
    esopPoolViewNavigationEvent?.cancel();
    mutualFundPortfolioTabChangeEvent?.cancel();
    mutualFundDeepLinkTriggeredEventSubscription?.cancel();
    mutualFundJobStatusUpdateEventSubscription?.cancel();
    mutualFundDeepLinkMultiplayerEventSubscription?.cancel();
    mutualFundPlayerPinnedEventSubscription?.cancel();
    mutualFundPlayerUnpinnedEventSubscription?.cancel();
    refreshMutualFundEventSubscription?.cancel();
  }
}
