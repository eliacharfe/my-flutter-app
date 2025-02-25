import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:flutter_svg/svg.dart';
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

Widget urlLauncher(String imgPath, String url) {
  return IconButton(
    icon: SvgPicture.asset(imgPath, width: 35),
    onPressed: () async {
      await launchUrl(Uri.parse(url));
    },
  );
}

class DrawersMobile extends StatelessWidget {
  const DrawersMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return Drawer(
      backgroundColor: isDarkMode ? AppColors.darkGray : AppColors.scaffoldColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DrawerHeader(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 2.0, color: Colors.tealAccent),
              ),
              child: Image.asset(
                isDarkMode ? 'assets/images/icon3.png' : 'assets/images/icon2.png',
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          TabsMobile(text: "home_drawer".translate(context), route: '/'),
          const SizedBox(height: 20.0),
          TabsMobile(text: "about".translate(context), route: '/about'),
          const SizedBox(height: 20.0),
          TabsMobile(text: "terms".translate(context), route: '/terms'),
          const SizedBox(height: 20.0),
          TabsMobile(text: "manual".translate(context), route: '/manual'),
          const SizedBox(height: 20.0),
          TabsMobile(text: "contact_drawer".translate(context), route: '/contact'),
          const SizedBox(height: 20.0),
          TabsMobile(text: "settings".translate(context), route: '/settings'),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [],
          ),
        ],
      ),
    );
  }
}

class TabsMobile extends StatelessWidget {
  final String text;
  final String route;

  const TabsMobile({super.key, required this.text, required this.route});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: isDarkMode ? Colors.white : Colors.black,
      child: Text(
        text,
        style: GoogleFonts.openSans(
          fontSize: 20.0,
          color: isDarkMode ? Colors.black : Colors.white,
          fontWeight: isDarkMode ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
      onPressed: () {
        debugPrint("*******------------ Push Route: $route -----------*******");
        if (route == '/') {
          Navigator.of(context, rootNavigator: true).pushReplacementNamed('/');
        } else {
          Navigator.of(context, rootNavigator: true).pushNamed(route);
        }
      },
    ).withAnimation(duration: Duration(milliseconds: 2000));
  }
}
