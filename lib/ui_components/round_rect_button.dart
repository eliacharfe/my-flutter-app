import 'package:flutter/material.dart';

//ignore: must_be_immutable
class SelectableRectButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // if no function provided then button is not clickable
  final Color borderColor;
  final Color selectedColorBG;
  final Color unSelectedColorBG;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  bool isSelected;
  final double? borderRadius;
  final FontWeight titleFontWeight;
  final EdgeInsets titlePadding;
  final IconData? icon;

  SelectableRectButton({
    super.key,
    required this.text,
    this.onPressed,
    required this.borderColor,
    required this.selectedColorBG,
    required this.unSelectedColorBG,
    required this.selectedTextColor,
    required this.unselectedTextColor,
    required this.isSelected,
    this.borderRadius,
    this.titleFontWeight = FontWeight.w600,
    this.titlePadding = EdgeInsets.zero,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed != null
          ? () {
              onPressed!();
              isSelected = !isSelected;
            }
          : null,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          isSelected ? selectedColorBG : unSelectedColorBG,
        ),
        padding: WidgetStateProperty.all(const EdgeInsets.all(6)),
        minimumSize: WidgetStateProperty.all<Size>(const Size(67, 30)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            side: BorderSide(color: isSelected ? Colors.transparent : borderColor, width: isSelected ? 0 : 1),
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              alignment: Alignment.center,
              padding: titlePadding, // Padding for top and bottom
              child: Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 14, color: isSelected ? Colors.white : Colors.black),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    text,
                    style: TextStyle(
                      color: isSelected ? selectedTextColor : unselectedTextColor,
                      fontSize: 14,
                      fontWeight: titleFontWeight,
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
