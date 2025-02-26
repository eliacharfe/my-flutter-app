import '../packages/default_packages.dart';
import '../packages/utlis_packages.dart';

class SansBold extends StatelessWidget {
  final String text;
  final double size;

  const SansBold(this.text, this.size, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}

class Sans extends StatelessWidget {
  final String text;
  final double size;
  final Color? color;
  final FontWeight? fontWeight;

  const Sans(this.text, this.size, {super.key, this.color, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Text(
      text,
      style: GoogleFonts.openSans(
          fontSize: size,
          color: color ?? ((themeProvider.themeMode == ThemeMode.dark) ? Colors.white : Colors.black),
          fontWeight: fontWeight),
    );
  }
}
