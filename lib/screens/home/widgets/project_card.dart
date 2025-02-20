import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final double width;
  final double? height;
  final Widget child;

  const ProjectCard({super.key, required this.width, required this.child, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Card(
        color: Color(0xFFE0F2F1),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
