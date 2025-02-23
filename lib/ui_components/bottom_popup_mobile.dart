import 'package:eliachar_feig/packages/utlis_packages.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class BottomPopupMobile extends StatefulWidget {
  final String title;
  final String text;
  final Function onSecondaryAction;
  final Function onPrimaryAction;
  final String primaryButtonTitle;
  final String secondaryButtonTitle;
  final Color secondaryButtonColor;
  final Color primaryButtonColor;
  final double mobilePopupHeight;
  final bool isDarkMode;

  const BottomPopupMobile({
    super.key,
    required this.title,
    required this.text,
    required this.onPrimaryAction,
    required this.onSecondaryAction,
    this.primaryButtonTitle = "No, Cancel",
    this.secondaryButtonTitle = "Yes",
    this.secondaryButtonColor = const Color.fromRGBO(211, 21, 37, 1),
    this.primaryButtonColor = Colors.black,
    this.mobilePopupHeight = 220,
    required this.isDarkMode,
  });

  @override
  State<BottomPopupMobile> createState() => _BottomPopupMobileState();
}

class _BottomPopupMobileState extends State<BottomPopupMobile> {
  bool isPrimaryLoading = false;
  bool isSecondaryLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.mobilePopupHeight,
      decoration: BoxDecoration(
        color: widget.isDarkMode ? AppColors.darkGray : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(22),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              widget.title.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            widget.text,
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Row(
            children: [
              TextButton(
                onPressed: () async {
                  setState(() {
                    isPrimaryLoading = true;
                  });
                  try {
                    await widget.onPrimaryAction();
                  } finally {
                    setState(() {
                      isPrimaryLoading = false;
                    });
                  }
                },
                child: isPrimaryLoading
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: CircularProgressIndicator(color: widget.primaryButtonColor),
                        ),
                      )
                    : Text(
                        widget.primaryButtonTitle,
                        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800, color: widget.primaryButtonColor),
                      ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () async {
                  setState(() {
                    isSecondaryLoading = true;
                  });
                  try {
                    await widget.onSecondaryAction();
                  } finally {
                    setState(() {
                      isSecondaryLoading = false;
                    });
                  }
                },
                child: isSecondaryLoading
                    ? SizedBox(
                        height: 24,
                        width: 24,
                        child: Center(
                          child: CircularProgressIndicator(color: widget.secondaryButtonColor),
                        ),
                      )
                    : Text(
                        widget.secondaryButtonTitle,
                        style:
                            TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800, color: widget.secondaryButtonColor),
                      ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
