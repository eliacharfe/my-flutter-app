import 'package:flutter/material.dart';

AppBar topAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.black,
    toolbarHeight: 50,
    title: Row(
      children: [
        Spacer(),
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(child: Image.asset('assets/images/icon.png')),
        ),
        Spacer(),
      ],
    ),
  );
}
