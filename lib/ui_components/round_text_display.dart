import 'package:eliachar_feig/ui_components/icon_with_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundTextDisplay extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color textColor;
  final Color? borderColor;
  final double? borderRadius;
  final double? fontSize;
  final bool isBold;
  final IconData? icon;
  final double? iconSize;
  final String? imageAsset;
  final EdgeInsets? padding;

  const RoundTextDisplay({
    super.key,
    required this.text,
    required this.bgColor,
    required this.textColor,
    this.borderColor,
    this.borderRadius,
    this.fontSize,
    required this.isBold,
    this.icon,
    this.iconSize,
    this.imageAsset,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(borderRadius ?? 15),
            border: Border.all(color: borderColor != null ? borderColor! : Colors.transparent)),
        child: icon != null
            ? Padding(
                padding: padding ?? EdgeInsets.zero,
                child: IconWithText(iconData: icon, iconSize: iconSize ?? 20, color: textColor, text: text),
              )
            : imageAsset != null
                ? Padding(
                    padding: padding ?? EdgeInsets.zero,
                    child: IconWithText(
                        iconData: SizedBox(
                          width: 20,
                          height: 20,
                          child: Image.asset(
                            imageAsset!,
                            color: textColor,
                          ),
                        ),
                        color: textColor,
                        text: text),
                  )
                : Padding(
                    padding: padding ?? EdgeInsets.zero,
                    child: Text(
                      text,
                      style: GoogleFonts.openSans(
                          color: textColor,
                          fontSize: fontSize ?? 10.0,
                          fontWeight: isBold ? FontWeight.bold : FontWeight.w500),
                    ),
                  ),
      ),
    );
  }
}
