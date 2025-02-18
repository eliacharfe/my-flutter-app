import 'package:flutter/material.dart';

extension GestureMouseRegionExtension on Widget {
  Widget onTapWithCursor(void Function()? onTap, {bool disabled = false, String? key}) {
    return GestureDetector(
      key: key != null ? Key(key) : null,
      onTap: !disabled ? onTap : () => {},
      child: MouseRegion(
        cursor: disabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
        child: this,
      ),
    );
  }
}

extension WidgetPadding on Widget {
  Widget withPadding(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget responsive(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: this,
    );
  }
}

extension WidgetLoading on Widget {
  Widget isLoading({required bool isLoading, double? height}) {
    return isLoading ? getLoader(height: height) : this;
  }
}

Widget getLoader({double? height}) {
  return SizedBox(
    height: height,
    child: const Center(
      child: CircularProgressIndicator(
        color: Colors.black,
      ),
    ),
  );
}
