import 'package:eliachar_feig/screens/about_me.dart';
import 'package:eliachar_feig/screens/contact_me.dart';
import 'package:eliachar_feig/screens/home/home.dart';
import 'package:eliachar_feig/screens/manual_screen.dart';
import 'package:eliachar_feig/screens/settings_page.dart';
import 'package:eliachar_feig/screens/terms_page.dart';
import 'package:eliachar_feig/utils/app_colors.dart';
import 'package:flutter/material.dart';

class RouterManager {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Home(),
        );

      default:
        return ModalSheetRoute(settings.name);
    }
  }
}

class ModalSheetRoute extends PageRoute<void> {
  final String? routeName;

  ModalSheetRoute(this.routeName);

  @override
  Color? get barrierColor => Colors.black.withValues(alpha: 0.5);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    Widget? page;
    switch (routeName) {
      case '/about':
        page = const AboutMe(showAppBar: false);
        break;
      case '/terms':
        page = TermsPage(showAppBar: false);
        break;
      case '/manual':
        page = ManualScreen(showAppBar: false);
        break;
      case '/contact':
        page = const ContactMe(showAppBar: false);
        break;
      case '/settings':
        page = const SettingsPage(showAppBar: false);
        break;
    }

    if (page == null) {
      return const SizedBox.shrink();
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.93,
        decoration: const BoxDecoration(
          color: AppColors.scaffoldColor,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: page,
            ),
            Positioned(
              top: 8,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    const begin = Offset(0.0, 1.0);
    const end = Offset(0.0, 0.0);
    const reverseBegin = Offset(0.0, 0.0);
    const reverseEnd = Offset(0.0, 1.0);

    var slideInAnimation = Tween<Offset>(begin: begin, end: end).animate(animation);
    var slideOutAnimation = Tween<Offset>(begin: reverseBegin, end: reverseEnd).animate(secondaryAnimation);

    return SlideTransition(
      position: animation.status == AnimationStatus.reverse ? slideOutAnimation : slideInAnimation,
      child: child,
    );
  }
}
