import 'package:flutter/material.dart';
import 'package:hartman_web_view/widgets/navigation/navigation_container.dart';

class Home extends StatefulWidget {
  final MyWebViewController myWebViewController;

  const Home({super.key, required this.myWebViewController});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Home")),
    );
  }
}
