import 'package:eliachar_feig/packages/ui_components_packages.dart';
import '../packages/default_packages.dart';

class AnimatedBulletPointsCard extends StatefulWidget {
  final String title;
  final Map<String, List<String>> sections;
  final bool? reverse;

  const AnimatedBulletPointsCard({
    super.key,
    required this.title,
    required this.sections,
    this.reverse,
  });

  @override
  AnimatedCardState createState() => AnimatedCardState();
}

class AnimatedCardState extends State<AnimatedBulletPointsCard> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 2),
  )..repeat(reverse: true);

  late final Animation<Offset> animation = Tween(
    begin: widget.reverse == true ? const Offset(0, 0.02) : Offset.zero,
    end: widget.reverse == true ? Offset.zero : const Offset(0, 0.02),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return SlideTransition(
      position: animation,
      child: WidgetStyling.buildBulletPointsCard(
        title: widget.title,
        sections: widget.sections,
        isDarkMode: isDarkMode,
      ),
    );
  }
}
