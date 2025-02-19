import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavIcon extends StatelessWidget {
  final IconData iconData;
  final bool isSelected;
  final String label;
  final Function callback;

  const BottomNavIcon({
    super.key,
    required this.iconData,
    required this.isSelected,
    required this.label,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(4),
            decoration: const BoxDecoration(),
            child: Icon(
              iconData,
              size: 20,
              color: isSelected ? Colors.grey : Colors.white,
            ),
          ),
          Text(
            label,
            style: GoogleFonts.openSans(
                color: isSelected ? Colors.grey : Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
