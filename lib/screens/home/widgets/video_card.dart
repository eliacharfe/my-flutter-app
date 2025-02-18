import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final double width;
  final Widget child;

  const VideoCard({super.key, required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: child,
        ),
      ),
    );
  }
}
