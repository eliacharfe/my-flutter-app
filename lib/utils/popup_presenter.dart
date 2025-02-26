import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:eliachar_feig/ui_components/bottom_popup_mobile.dart';
import 'package:flutter/material.dart';
import '../packages/utlis_packages.dart';

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

  static void showCustomDialog({
    required BuildContext context,
    required bool isDarkMode,
    required String title,
    String? message,
    Widget? content,
  }) async {
    Widget dialogContent = content ?? Text(message ?? "");

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: dialogContent,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: isDarkMode ? Colors.grey.shade50 : Colors.teal,
            ),
            child: Text("close".translate(context)),
          ),
        ],
      ),
    );
  }

  static Future<void> showTextFieldDialog({
    required BuildContext context,
    required bool isDarkMode,
    required String title,
    required TextEditingController controller,
    required String cancelText,
    required String actionText,
    required VoidCallback onAction,
  }) async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode ? AppColors.darkGray : Colors.white,
        title: Text(title).applySansStyle(size: 24, fontWeight: FontWeight.w500),
        content: TextField(
          controller: controller,
          keyboardAppearance: isDarkMode ? Brightness.dark : Brightness.light,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(cancelText)
                .applySansStyle(color: isDarkMode ? Colors.red : AppColors.red, fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              onAction();
              Navigator.pop(context);
            },
            child: Text(actionText)
                .applySansStyle(fontWeight: FontWeight.w600, color: isDarkMode ? Colors.white : Colors.teal),
          ),
        ],
      ),
    );
  }

  static void showPopupMenu({
    required BuildContext context,
    required TapDownDetails details,
    required List<String> items,
    required String currentItem,
    required Function(String) onItemSelected,
  }) {
    final screenSize = MediaQuery.of(context).size;

    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(
        details.globalPosition.dx,
        details.globalPosition.dy,
        screenSize.width - details.globalPosition.dx,
        screenSize.height - details.globalPosition.dy,
      ),
      items: items.map((item) {
        return PopupMenuItem<String>(
          value: item,
          child: Row(
            children: [
              Text(item),
              if (item == currentItem) ...[
                SizedBox(width: 10),
                Icon(Icons.check, color: context.isDarkMode ? Colors.white : Colors.black),
              ],
            ],
          ),
        );
      }).toList(),
    ).then((selected) {
      if (selected != null) {
        onItemSelected(selected);
      }
    });
  }
}
