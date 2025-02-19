import 'package:flutter/material.dart';

class WidgetStyling {
  static Widget buildPageTitle(String title) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: 27.5, color: Colors.black),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
