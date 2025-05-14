import 'package:boilerplate_flutter/core/third-party/environment.dart';
import 'package:boilerplate_flutter/core/utils/logger.dart';

enum UrlNo { urlOne, urlTwo }

class ApiEndpoints {
  static final ApiEndpoints _instance = ApiEndpoints._privateConstructor();
  static ApiEndpoints get instance => _instance;
  static Environmentx? _environment;

  ApiEndpoints._privateConstructor() {
    if (_environment == null) {
      logger.info(
        "${"ApiEndpoints----->"} ,Call init to set the environment, environment set to dev by default",
      );
      _environment = Environmentx.staging;
    }
  }

  /// Set Environment
  static void init(Environmentx environment) {
    _environment = environment;
  }

  static const String devURL = "https://api-staging.mular.co/api";
  static const String productionURL = "https://api.mular.co/api";

  static final baseUrl = _environment == Environmentx.prod ? productionURL : devURL;

  /// version
  String get version => "v1";

  // Authentication
  String get login => "/api/v1/auth/customer/Login";
  String get setPin => "/api/v1/auth/customer/SetPin";
  String get validatePin => "/api/v1/auth/customer/ValidatePin";
  String get changePin => "/api/v1/auth/customer/ChangePin";
  String get changePassword => "/api/v1/auth/customer/ChangePassword";
  String get resetPin => "/api/v1/auth/customer/InitiatePinResetViaOtp";
  String get finalizeResetPin => "/api/v1/auth/customer//FinalizePinReset";
  String get initiateForgotPassword => "/api/v1/auth/customer/InitiatePasswordResetWithOtp";
  String get verifyForgotPasswordOtp => "/api/v1/partner/customer/onboarding/VerifyOtp";
  String get completeForgotPassword => "/api/v1/auth/customer/FinalizePasswordReset";
  // String get changePassword => "/api/v1/auth/customer/ChangePassword";

  // Security Questions
  String get getSecurityQuestion => "/api/v1/SecurityQuestion/GetSecurityQuestions";
  String get getUserSecurityQuestion => "/api/v1/SecurityQuestion/GetUserSecurityQuestions";
  String get setSecurityQuestion => "/api/v1/SecurityQuestion/SetUserSecurityQuestion";
  String get initiateValidateDevice => "/api/v1/device/initiate";
  String get validateSecurityQuestion => "/api/v1/device/security/validate";

  // Onboarding
  String get initiateOnboarding =>
      "/api/v1/partner/customer/onboarding/InitiateIndividualOnboarding";
  String get verifyPhoneNumber => "/api/v1/partner/customer/onboarding/VerifyPhoneNumber";
  String get createPassword => "/api/v1/partner/customer/onboarding/CreatePassword";
  String get resendOtpViaEmail => "/api/v1/partner/customer/onboarding/ResendOtpViaEmail";
  String get getCountries => "/api/v1/Utility/countries?includeFlagImage=true";
  String get getStates => "/api/v1/Utility/states";
  String get getCities => "/api/v1/Utility/cities";

  // KYC
  String get kycStatus => "/api/v1/kyc/customer/GetStatus";
  String get initiateKYC => "/api/v1/kyc/customer/Initiate";
  String get resubmitBvnOrSsn => "/api/v1/kyc/customer/ResubmitBvnOrSsn";
  String get resubmitMeansOfId => "/api/v1/kyc/customer/ResubmitMeansOfId";
  String get resubmitProofOfAddress => "/api/v1/kyc/customer/ResubmitProofOfAddress";
  String get getIdDocumentsTypes => "/api/v1/internal/idDocumentTypes";
  String get getProofOfAddressTypes => "/api/v1/internal/proofOfAddressTypes";
  String get initiateBusinessKYB => "/api/v1/kyc/customer/InitateBusinessKyb";
  String get addDirectors => "/api/v1/kyc/customer/AddDirectors";
  String get addSecretaries => "/api/v1/kyc/customer/AddSecretaries";
  String get addShareholders => "/api/v1/kyc/customer/AddSharedHolders";
  String get addBusinessDocuments => "/api/v1/kyc/customer/AddBusinessDocuments";
  String get getBusinessTypes => "/api/v1/internal/businessTypes";
  String get getBusinessIndustries => "/api/v1/partner/kyc/GetBusinessIndustry";
  String get getSourceOfIncome => "/api/v1/kyc/customer/SourcesOfIncome";
  String get getEmploymentStatus => "/api/v1/kyc/customer/EmploymentStatus";
  String get getIncomeBand => "/api/v1/kyc/customer/IncomeBands";
  String get getAccountDesignation => "/api/v1/kyc/customer/AccountDesignations";

  // Accounts
  String get getAccounts => "/api/v1/accounts/customer/GetAccounts";
  String get getAccountsCurrencies => "/api/v1/account-opening/currencies";
  String get createIndividualAccount => "/api/v1/accounts/customer/Individual/CreateNewAccount";

  // Funding
  String get getBanks => "/api/v1/bank";
  String get getUssdBanks => '/api/v1/bank/ussd';
  String get getFundingOptions => '/api/v1/funding/customer';
  String get checkoutFunding => "/api/v1/funding/flutterwave/customer/checkout/initiate";
  String get initiateCardFunding => "/api/v1/funding/flutterwave/customer/card/initiate";
  String get validateCardFunding => "/api/v1/funding/flutterwave/card/validate";
  String get authorizeCardFunding => "/api/v1/funding/flutterwave/card/authorize";
  String get initiateUSSDFunding => "/api/v1/funding/flutterwave/customer/ussd/initiate";
  String get fundWithBankTransfer => "/api/v1/funding/flutterwave/customer/banktransfer/initiate";
  String get verifyTransaction => "/api/v1/funding/flutterwave/charge/verify";

  // Send Money
  String get getCorridors => "/api/v1/sendmoney/corridors/ST000015";
  String get sendToBank => "/api/v1/sendmoney/Bank";
  String get sendMoney => "/api/v1/sendmoney";
  String get validateAccountNumber => "/api/v1/sendmoney/validateAccountNumber";
  String get sendToMobileMoney => "/api/v1/sendmoney/MobileMoney";
  String get sendToInAppUser => "/api/v1/sendmoney/toInAppUser";
  String get sendCharge => "/api/v1/sendmoney/charge";
  String get getBeneficiaries => "/api/v1/Beneficiary";
  String get addNewBeneficiaries => "/api/v1/Beneficiary";
  String get sendMoneyFields => "/api/v1/sendmoney/fields";

  // Transaction
  String get getCustomerTransactions => "/api/v1/transaction/GetCustomerTransactions";
  String get getTransactionDetails => "/api/v1/transaction/GetTransactionDetail";

  // Refresh Token
  String get refresh => "/$version/auth/refresh";

  // Auth Token
  String get token => "token";
}

enum Environment { dev, prod }
