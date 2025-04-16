import 'package:flutter/material.dart';
import 'package:foodtek_project/l10n/generated/app_localizations.dart';

List<String> authTitles(BuildContext context) {
  return [
    AppLocalizations.of(context)!.login,
    AppLocalizations.of(context)!.signup,
    AppLocalizations.of(context)!.forgotPassword,
    AppLocalizations.of(context)!.resetPassword,
    AppLocalizations.of(context)!.verify,
    AppLocalizations.of(context)!.updatePassword,
    AppLocalizations.of(context)!.congrats,
  ];
}
List<String> authDescriptions(BuildContext context) {
  return [
    AppLocalizations.of(context)!.enterEmailOrPhone,
    AppLocalizations.of(context)!.dontHaveAccount,
    AppLocalizations.of(context)!.codeSent,
    AppLocalizations.of(context)!.enterPromo, 
    AppLocalizations.of(context)!.codeSent,
    AppLocalizations.of(context)!.passwordResetSuccess,
    AppLocalizations.of(context)!.orderNote, 
  ];
}

List<String> authFirstButtonTexts(BuildContext context) {
  return [
    AppLocalizations.of(context)!.login,
    AppLocalizations.of(context)!.register,
    AppLocalizations.of(context)!.send,
    AppLocalizations.of(context)!.updatePassword,
    AppLocalizations.of(context)!.verify,
    AppLocalizations.of(context)!.update,
    AppLocalizations.of(context)!.trackOrder,
  ];
}

List<String> authSecondButtonTexts(BuildContext context) {
  return [
    '',
    AppLocalizations.of(context)!.backToLogin,
    '',
    AppLocalizations.of(context)!.cancel,
    '',
    '',
    '',
  ];
}
