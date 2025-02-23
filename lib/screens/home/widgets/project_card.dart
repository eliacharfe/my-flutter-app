import 'package:eliachar_feig/packages/default_packages.dart';
import 'package:eliachar_feig/packages/ui_components_packages.dart';
import 'package:eliachar_feig/utils/app_colors.dart';

class ProjectCard extends StatelessWidget {
  final double width;
  final double? height;
  final Widget child;

  const ProjectCard({super.key, required this.width, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: isDarkMode ? Colors.grey.shade900 : AppColors.lightTeal,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
