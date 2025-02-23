import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:flutter/material.dart';
import '../../packages/utlis_packages.dart';

class WidgetStyling {
  static Widget buildPageTitle(String title) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(child: SansBold(title, 27.5)),
        ],
      ),
    );
  }

  static AppBar buildTopAppBar({
    required String title,
    BuildContext? context,
    bool showLogoIcon = true,
    String? leftButtonText,
    VoidCallback? onBackPressed,
  }) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      centerTitle: true,
      toolbarHeight: 50,
      title: SansBold(title, 20),
      leading: (showLogoIcon)
          ? SizedBox(
              height: 24,
              width: 24,
              child: ClipRRect(child: Image.asset('assets/images/icon.png')),
            )
          : null,
    );
  }

  static Widget buildBulletPointsCard(
      {required String title, required Map<String, List<String>> sections, required bool isDarkMode}) {
    return Card(
      color: isDarkMode ? Colors.grey.shade900 : Color(0xFFE0F2F1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle(title),
            SizedBox(height: 8),
            ...sections.entries.map(
              (entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCategory(entry.key),
                    ...entry.value.map((item) => buildBulletPoint(item)),
                    SizedBox(height: 8),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  static Widget buildSectionTitle(String title) {
    return SansBold(title, 20);
  }

  static Widget buildCategory(String category) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 4),
      child: Sans(category, 16, color: Colors.grey),
    );
  }

  static Widget buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 12, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(
            child: Sans(text, 14),
          ),
        ],
      ),
    );
  }

  static Widget getLoader({double? height}) {
    return SizedBox(
      height: height,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.black,
        ),
      ),
    );
  }

  static Container getContainerFor({
    required List<Widget>? widgetList,
    required String emptyContainerText,
    bool showEmptyContainerIcon = true,
    required bool isDarkMode,
    Color? backgroundColor,
  }) {
    if (widgetList == null) {
      return getUnableToLoadContainer(isDarkMode: isDarkMode);
    } else if (widgetList.isEmpty) {
      return getNoDataContainerWith(
        emptyContainerText,
        showEmptyContainerIcon: showEmptyContainerIcon,
        isDarkMode: isDarkMode,
      );
    }

    Widget child;
    child = Wrap(
      runSpacing: 10,
      spacing: 10,
      children: widgetList.map((widget) {
        return widget.withPadding(EdgeInsets.symmetric(horizontal: 15));
      }).toList(),
    );

    return Container(
      width: double.infinity,
      color: backgroundColor ?? (isDarkMode ? AppColors.darkGray : AppColors.scaffoldColor),
      child: child,
    );
  }

  static Container getUnableToLoadContainer({
    String text = "Unable to load data, please try again",
    required bool isDarkMode,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      color: isDarkMode ? Colors.grey.shade600 : Colors.white,
      child: Container(
          padding: const EdgeInsets.fromLTRB(0, 35, 0, 35),
          height: 130,
          child: Column(
            children: [
              Icon(Icons.refresh, size: 24, color: isDarkMode ? Colors.white : AppColors.lightGrey),
              const SizedBox(
                height: 10,
              ),
              Text(
                text,
                style: TextStyle(color: isDarkMode ? Colors.white : AppColors.lightGrey, fontSize: 12),
              ),
            ],
          )),
    );
  }

  static Container getUnableToLoadContainerForScreen() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Container(
          padding: const EdgeInsets.fromLTRB(0, 100, 0, 35),
          child: const Column(
            children: [
              Icon(Icons.refresh, size: 40, color: AppColors.lightGrey),
              SizedBox(
                height: 10,
              ),
              Text(
                "Unable to load data, please try again",
                style: TextStyle(color: AppColors.lightGrey, fontSize: 16, fontWeight: FontWeight.w800),
              ),
            ],
          )),
    );
  }

  static Container getNoDataContainerWith(
    String text, {
    bool showEmptyContainerIcon = true,
    required bool isDarkMode,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      color: isDarkMode ? Colors.grey.shade600 : Colors.white,
      child: Container(
          color: isDarkMode ? Colors.grey.shade600 : Colors.white,
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              Visibility(
                visible: showEmptyContainerIcon,
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.asset('assets/material_symbols/scan_delete.png',
                      color: isDarkMode ? Colors.white : AppColors.lightGrey),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(text,
                  style: TextStyle(color: isDarkMode ? Colors.white : AppColors.lightGrey, fontSize: 12),
                  textAlign: TextAlign.center),
            ],
          )),
    );
  }
}
