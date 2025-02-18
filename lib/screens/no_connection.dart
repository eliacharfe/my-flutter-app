import 'package:flutter/material.dart';
import 'package:eliachar_feig/constants/app_colors.dart';

class NoConnection extends StatelessWidget {
  const NoConnection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Image.asset(
                'assets/images/cloud_no_network.png',
                width: 75,
                height: 75,
              ),
              Container(
                padding: EdgeInsets.all(5),
                child: Text(
                  "No network connection",
                  style: TextStyle(
                    color: AppColors.hmDarkBlue,
                    fontSize: 27.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.hmDarkBlue,
                    fixedSize: Size(200, 50),
                  ),
                  child: Text("Reload"),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
