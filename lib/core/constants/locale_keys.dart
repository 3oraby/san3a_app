abstract class LocaleKeys {
  // messages.success
  static const messagesSuccessVerificationCodeSent =
      "messages.success.verification_code_sent";
  static const messagesSuccessNewVerificationCodeSent =
      "messages.success.new_verification_code_sent";

  // messages.failures
  static const messagesFailuresIncorrectCredentials =
      "messages.failures.incorrect_credentials";
  static const messagesFailuresInactiveUser = "messages.failures.inactive_user";
  static const messagesFailuresUnexpectedError =
      "messages.failures.unexpected_error";
  static const messagesFailuresAccountAlreadyExists =
      "messages.failures.account_already_exists";
  static const messagesFailuresUsernameAlreadyExists =
      "messages.failures.username_already_exists";
  static const messagesFailuresInvalidOrExpiredCode =
      "messages.failures.invalid_or_expired_code";
  static const messagesFailuresInvalidEmail = "messages.failures.invalid_email";
  static const messagesFailuresUserAlreadyActive =
      "messages.failures.user_already_active";
  static const messagesFailuresVerificationCodeNotFound =
      "messages.failures.verification_code_not_found";

  // validation
  static const validationFieldIsRequired = "validation.field_is_required";
  static const validationEmailIsRequired = "validation.email_is_required";
  static const validationInvalidEmail = "validation.invalid_email";
  static const validationPasswordIsRequired = "validation.password_is_required";
  static const validationPasswordTooShort = "validation.password_too_short";
  static const validationPhoneIsRequired = "validation.phone_is_required";
  static const validationInvalidPhone = "validation.invalid_phone";
  static const validationAgeIsRequired = "validation.age_is_required";
  static const validationInvalidAge = "validation.invalid_age";
  static const validationAgeTooYoung = "validation.age_too_young";
  static const validationAgeTooOld = "validation.age_too_old";
  static const validationConfirmPasswordIsRequired =
      "validation.confirm_password_is_required";
  static const validationPasswordsDoNotMatch =
      "validation.passwords_do_not_match";
  static const validationPasswordMustContain6Chars =
      "validation.password_must_contain_6_chars";
  static const validationPleaseEnterValidInstagram =
      "validation.please_enter_valid_instagram";
  static const validationPleaseEnterValidTiktok =
      "validation.please_enter_valid_tiktok";
  static const validationInvalidNationalId = "validation.invalid_national_id";
  static const validationInvalidCrn = "validation.invalid_crn";
  static const validationInvalidTaxId = "validation.invalid_tax_id";
  static const validationEnterYourEmailToResetPassword =
      "validation.enter_your_email_to_reset_password";

  // auth_initial
  static const authInitialLetStart = "auth_initial.let`s_start";
  static const authInitialBestCraftsmenTitle =
      "auth_initial.best_craftsmen_title";
  static const authInitialLoginButton = "auth_initial.login_button";
  static const authInitialCreateAccountButton =
      "auth_initial.create_account_button";
  static const authInitialCreateAccountAgreeText =
      "auth_initial.create_account_agree_text";
  static const authInitialTermsAndConditions =
      "auth_initial.terms_and_conditions";

  // auth_login
  static const authLoginLogin = "auth_login.login";
  static const authLoginEmailAddress = "auth_login.email_address";
  static const authLoginPassword = "auth_login.password";
  static const authLoginForgotPassword = "auth_login.forgot_password";
  static const authLoginCreateNewAccount = "auth_login.create_new_account";
  static const authLoginLoginWithGoogle = "auth_login.login_with_google";

  // forget_password
  static const authForgetPasswordHelp = "auth_forget_password.help";
  static const authForgetPasswordResetPassword =
      "auth_forget_password.reset_password";
  static const authForgetPasswordEnterEmail =
      "auth_forget_password.enter_email";
  static const authForgetPasswordCodeWillBeSent =
      "auth_forget_password.code_will_be_sent";
  static const authForgetPasswordSendCode = "auth_forget_password.send_code";

  // verify_otp
  static const authVerifyOtpHelp = "auth_verify_otp.help";
  static const authVerifyOtpResetPassword = "auth_verify_otp.reset_password";
  static const authVerifyOtpEnterOtp = "auth_verify_otp.enter_otp";
  static const authVerifyOtpCodeSent = "auth_verify_otp.code_sent";
  static const authVerifyOtpConfirm = "auth_verify_otp.confirm";
  static const authVerifyOtpResendCode = "auth_verify_otp.resend_code";

  // reset_password
  static const authResetPasswordHelp = "auth_reset_password.help";
  static const authResetPasswordResetPassword =
      "auth_reset_password.reset_password";
  static const authResetPasswordEnterNewPassword =
      "auth_reset_password.enter_new_password";
  static const authResetPasswordPassword = "auth_reset_password.password";
  static const authResetPasswordConfirmPassword =
      "auth_reset_password.confirm_password";
  static const authResetPasswordConfirm = "auth_reset_password.confirm";

  // create_new_account
  static const createNewAccountTitle = "create_new_account.title";

  // choose_user_role
  static const createNewAccountChooseUserRoleCustomer =
      "create_new_account.choose_user_role.customer";
  static const createNewAccountChooseUserRoleCustomerDescription =
      "create_new_account.choose_user_role.customer_description";
  static const createNewAccountChooseUserRoleCraftsman =
      "create_new_account.choose_user_role.craftsman";
  static const createNewAccountChooseUserRoleCraftsmanDescription =
      "create_new_account.choose_user_role.craftsman_description";

  // customer_signup
  static const createNewAccountCustomerSignupName =
      "create_new_account.customer_signup.name";
  static const createNewAccountCustomerSignupNameHint =
      "create_new_account.customer_signup.name_hint";
  static const createNewAccountCustomerSignupEmail =
      "create_new_account.customer_signup.email";
  static const createNewAccountCustomerSignupEmailHint =
      "create_new_account.customer_signup.email_hint";
  static const createNewAccountCustomerSignupNationalId =
      "create_new_account.customer_signup.national_id";
  static const createNewAccountCustomerSignupNationalIdHint =
      "create_new_account.customer_signup.national_id_hint";
  static const createNewAccountCustomerSignupGovernorate =
      "create_new_account.customer_signup.governorate";
  static const createNewAccountCustomerSignupGovernorateHint =
      "create_new_account.customer_signup.governorate_hint";
  static const createNewAccountCustomerSignupPassword =
      "create_new_account.customer_signup.password";
  static const createNewAccountCustomerSignupPasswordHint =
      "create_new_account.customer_signup.password_hint";
  static const createNewAccountCustomerSignupConfirmPassword =
      "create_new_account.customer_signup.confirm_password";
  static const createNewAccountCustomerSignupConfirmPasswordHint =
      "create_new_account.customer_signup.confirm_password_hint";
  static const createNewAccountCustomerSignupAgreeTerms =
      "create_new_account.customer_signup.agree_terms";
  static const createNewAccountCustomerSignupCreateAccountButton =
      "create_new_account.customer_signup.create_account_button";
  static const createNewAccountCustomerSignupAlreadyHaveAccount =
      "create_new_account.customer_signup.already_have_account";
  static const createNewAccountCustomerSignupLoginButton =
      "create_new_account.customer_signup.login_button";

  // craftsman_signup
  static const createNewAccountCraftsmanSignupCraft =
      "create_new_account.craftsman_signup.craft";
  static const createNewAccountCraftsmanSignupOther =
      "create_new_account.craftsman_signup.other";
  static const createNewAccountCraftsmanSignupEnterCraft =
      "create_new_account.craftsman_signup.enter_craft";
  static const createNewAccountCraftsmanSignupSampleCraft =
      "create_new_account.craftsman_signup.sample_craft";
  static const createNewAccountCraftsmanSignupName =
      "create_new_account.craftsman_signup.name";
  static const createNewAccountCraftsmanSignupNameHint =
      "create_new_account.craftsman_signup.name_hint";
  static const createNewAccountCraftsmanSignupEmail =
      "create_new_account.craftsman_signup.email";
  static const createNewAccountCraftsmanSignupEmailHint =
      "create_new_account.craftsman_signup.email_hint";
  static const createNewAccountCraftsmanSignupNationalId =
      "create_new_account.craftsman_signup.national_id";
  static const createNewAccountCraftsmanSignupNationalIdHint =
      "create_new_account.craftsman_signup.national_id_hint";
  static const createNewAccountCraftsmanSignupGovernorate =
      "create_new_account.craftsman_signup.governorate";
  static const createNewAccountCraftsmanSignupGovernorateHint =
      "create_new_account.craftsman_signup.governorate_hint";
  static const createNewAccountCraftsmanSignupPassword =
      "create_new_account.craftsman_signup.password";
  static const createNewAccountCraftsmanSignupPasswordHint =
      "create_new_account.craftsman_signup.password_hint";
  static const createNewAccountCraftsmanSignupConfirmPassword =
      "create_new_account.craftsman_signup.confirm_password";
  static const createNewAccountCraftsmanSignupConfirmPasswordHint =
      "create_new_account.craftsman_signup.confirm_password_hint";
  static const createNewAccountCraftsmanSignupAgreeTerms =
      "create_new_account.craftsman_signup.agree_terms";
  static const createNewAccountCraftsmanSignupCreateAccountButton =
      "create_new_account.craftsman_signup.create_account_button";
  static const createNewAccountCraftsmanSignupAlreadyHaveAccount =
      "create_new_account.craftsman_signup.already_have_account";
  static const createNewAccountCraftsmanSignupLoginButton =
      "create_new_account.craftsman_signup.login_button";

  // verify_email
  static const createNewAccountVerifyEmailTitle =
      "create_new_account.verify_email.title";
  static const createNewAccountVerifyEmailEnterCode =
      "create_new_account.verify_email.enter_code";
  static const createNewAccountVerifyEmailEnterCodeSent =
      "create_new_account.verify_email.enter_code_sent";
  static const createNewAccountVerifyEmailConfirm =
      "create_new_account.verify_email.confirm";
  static const createNewAccountVerifyEmailResendCode =
      "create_new_account.verify_email.resend_code";
  static const createNewAccountVerifyEmailInvalidCode =
      "create_new_account.verify_email.invalid_code";
  static const createNewAccountVerifyEmailSuccessRegistration =
      "create_new_account.verify_email.success_registration";
}
