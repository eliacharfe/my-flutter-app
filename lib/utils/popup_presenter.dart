import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:eliachar_feig/ui_components/bottom_popup_mobile.dart';
import 'package:flutter/material.dart';

class PopupPresenter {
  static void showPopupWithContent({
    required BuildContext context,
    required Widget content,
    double maxWidth = 586,
  }) {
    showModalBottomSheet(
      context: context,
      sheetAnimationStyle: AnimationStyle(duration: const Duration(milliseconds: 300)),
      isScrollControlled: true,
      builder: (context) => content,
    );
  }

  static void showPopup({
    required BuildContext context,
    required String title,
    required String message,
    required String primaryButtonTitle,
    required String secondaryButtonTitle,
    required Function onPrimaryAction,
    required Function onSecondaryAction,
    Color? primaryButtonColor,
    Color? secondaryButtonColor,
    double maxWidth = 586,
    double mobilePopupHeight = 220,
  }) {
    showModalBottomSheet(
      context: context,
      sheetAnimationStyle: AnimationStyle(duration: const Duration(milliseconds: 300)),
      isScrollControlled: true,
      builder: (context) => BottomPopupMobile(
        title: title,
        text: message,
        onSecondaryAction: onSecondaryAction,
        onPrimaryAction: onPrimaryAction,
        primaryButtonTitle: primaryButtonTitle,
        secondaryButtonTitle: secondaryButtonTitle,
        secondaryButtonColor: secondaryButtonColor ?? (context.isDarkMode ? Colors.white : Colors.black),
        primaryButtonColor: primaryButtonColor ?? (context.isDarkMode ? Colors.white : Colors.black),
        mobilePopupHeight: mobilePopupHeight,
        isDarkMode: context.isDarkMode,
      ),
    );
  }
}
