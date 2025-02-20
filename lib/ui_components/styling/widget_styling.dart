import 'package:eliachar_feig/constants/components.dart';
import 'package:flutter/material.dart';

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

  static AppBar buildTopAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      toolbarHeight: 50,
      title: Row(
        children: [
          SizedBox(
            height: 40,
            width: 40,
            child: ClipRRect(child: Image.asset('assets/images/icon.png')),
          ),
          Spacer(),
        ],
      ),
    );
  }

  static Widget buildBulletPointsCard({
    required String title,
    required Map<String, List<String>> sections,
  }) {
    return Card(
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
}
