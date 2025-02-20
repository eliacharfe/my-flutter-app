import 'package:eliachar_feig/utils/app_colors.dart';
import 'package:eliachar_feig/utils/components.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final Color? bgColor;
  final String title;
  final String? topRightText;
  final IconData? rightIcon;
  final VoidCallback? onPressedRightIcon;
  final IconData? leftIcon;
  final VoidCallback? onPressedLeftIcon;
  final bool withTopMargin;
  const SectionTitle(
      {super.key,
      this.bgColor,
      required this.title,
      this.topRightText,
      this.rightIcon,
      this.onPressedRightIcon,
      this.leftIcon,
      this.onPressedLeftIcon,
      this.withTopMargin = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
      margin: EdgeInsets.only(top: withTopMargin ? 15 : 0),
      color: bgColor ?? AppColors.scaffoldColor,
      child: Row(
        children: [
          SansBold(title, 24),
          Visibility(
              visible: leftIcon != null,
              child: IconButton(
                onPressed: onPressedLeftIcon,
                icon: Icon(
                  leftIcon,
                  size: 16,
                  color: Colors.black,
                  weight: 400,
                ),
              )),
          const Spacer(),
          Visibility(
              visible: rightIcon != null,
              child: IconButton(
                onPressed: onPressedRightIcon,
                icon: Icon(
                  rightIcon,
                  size: 24,
                  color: Colors.black,
                  weight: 400,
                ),
              )),
          Visibility(
            visible: topRightText != null,
            child: Sans(topRightText ?? "", 12, fontWeight: FontWeight.w800),
          )
        ],
      ),
    );
  }
}
