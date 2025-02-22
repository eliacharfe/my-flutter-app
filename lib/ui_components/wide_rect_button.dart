import '../packages/default_packages.dart';
import '../packages/utlis_packages.dart';

class WideRectButton extends StatefulWidget {
  final Color bgColor;
  final Color textColor;
  final Color? borderColor;
  final Color loaderColor;
  final String text;
  final double? width;
  final Future<void> Function() onPressed;
  final bool isLoading;
  final bool isEnabled;

  const WideRectButton({
    super.key,
    this.bgColor = Colors.black,
    this.textColor = Colors.white,
    this.borderColor = Colors.black,
    this.loaderColor = Colors.black,
    required this.text,
    this.width,
    required this.onPressed,
    this.isLoading = false,
    this.isEnabled = true,
  });

  @override
  State<WideRectButton> createState() => _WideRectButtonState();
}

class _WideRectButtonState extends State<WideRectButton> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: widget.width ?? double.infinity,
      child: ElevatedButton(
        onPressed: widget.isEnabled
            ? () async {
                setState(() {
                  isLoading = true;
                });
                try {
                  await widget.onPressed();
                } finally {
                  setState(() {
                    isLoading = false;
                  });
                }
              }
            : null,
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: widget.isEnabled
                  ? widget.borderColor != null
                      ? BorderSide(color: widget.borderColor!, width: 1.0)
                      : widget.bgColor == Colors.white
                          ? const BorderSide(color: Colors.black, width: 1.0)
                          : BorderSide.none
                  : BorderSide.none),
          backgroundColor: widget.isEnabled ? widget.bgColor : AppColors.dividerColor,
        ),
        child: (isLoading || widget.isLoading)
            ? CircularProgressIndicator(color: widget.loaderColor)
            : Text(
                widget.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    color: widget.isEnabled ? widget.textColor : AppColors.lightGrey,
                    fontWeight: FontWeight.w800),
              ),
      ),
    );
  }
}
