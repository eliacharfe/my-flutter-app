import 'package:flutter/material.dart';
import '../packages/utlis_packages.dart';

class IconWithText extends StatelessWidget {
  final dynamic iconData;
  final String text;
  final Color color;
  final double? iconSize;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? textWidth;

  const IconWithText(
      {super.key,
      required this.iconData,
      required this.text,
      this.color = Colors.black,
      this.fontSize,
      this.iconSize,
      this.fontWeight,
      this.textWidth = 100});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (iconData is IconData)
          Icon(
            iconData,
            size: iconSize ?? 20,
            color: color,
          )
        else if (iconData is Widget)
          iconData,
        const SizedBox(width: 5),
        ConstrainedBox(
            constraints: BoxConstraints(maxWidth: textWidth!),
            child: Sans(
              text,
              fontSize ?? 14,
              color: color,
              fontWeight: fontWeight ?? FontWeight.w500,
            )),
      ],
    );
  }
}
