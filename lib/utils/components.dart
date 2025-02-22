import 'package:eliachar_feig/ui_components/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Text(
      text,
      style: GoogleFonts.openSans(fontSize: size, color: color ?? Colors.black, fontWeight: fontWeight),
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
    return Drawer(
      backgroundColor: Colors.white,
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
                'assets/images/icon2.png',
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          const TabsMobile(text: "Home", route: '/'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "About", route: '/about'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Terms", route: '/terms'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Manual", route: '/manual'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Contact", route: '/contact'),
          const SizedBox(height: 20.0),
          const TabsMobile(text: "Settings", route: '/settings'),
          const SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              urlLauncher("assets/instagram.svg", "https://www.instagram.com/tomcruise/"),
              urlLauncher("assets/twitter.svg", "https://www.twitter.com/tomcruise"),
              urlLauncher("assets/github.svg", "https://github.com/sagnik150699/paulina_knop"),
            ],
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
    return MaterialButton(
      elevation: 20.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      height: 50.0,
      minWidth: 200.0,
      color: Colors.black,
      child: Text(
        text,
        style: GoogleFonts.openSans(fontSize: 20.0, color: Colors.white),
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
