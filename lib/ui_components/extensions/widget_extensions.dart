import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:flutter/material.dart';

extension GestureMouseRegionExtension on Widget {
  Widget onTapWithCursor(void Function()? onTap, {bool disabled = false, String? key}) {
    return GestureDetector(
      key: key != null ? Key(key) : null,
      onTap: !disabled ? onTap : () => {},
      child: MouseRegion(
        cursor: disabled ? SystemMouseCursors.basic : SystemMouseCursors.click,
        child: this,
      ),
    );
  }
}

extension WidgetPadding on Widget {
  Widget withPadding(EdgeInsets padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget responsive(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: this,
    );
  }
}

extension WidgetLoading on Widget {
  Widget isLoading({required bool isLoading, double? height}) {
    return isLoading ? WidgetStyling.getLoader(height: height) : this;
  }
}

extension WidgetNavigator on Widget {
  Widget withNavigator() {
    return Navigator(
      key: GlobalKey<NavigatorState>(),
      onGenerateRoute: (settings) {
        Widget page = this;

        return RouteWrapper(page: page);
      },
    );
  }
}

extension AnimationExtension on Widget {
  Widget withAnimation({Duration duration = const Duration(seconds: 1)}) {
    return _AnimatedWidgetWrapper(
      duration: duration,
      child: this,
    );
  }
}

class _AnimatedWidgetWrapper extends StatefulWidget {
  final Widget child;
  final Duration duration;

  const _AnimatedWidgetWrapper({required this.child, required this.duration});

  @override
  State<_AnimatedWidgetWrapper> createState() => _AnimatedWidgetWrapperState();
}

class _AnimatedWidgetWrapperState extends State<_AnimatedWidgetWrapper> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  late Animation<Offset> slideAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: widget.duration);

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );

    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOut),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: fadeAnimation,
      child: SlideTransition(
        position: slideAnimation,
        child: widget.child,
      ),
    );
  }
}
