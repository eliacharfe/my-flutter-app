import 'package:flutter/material.dart';
import 'package:eliachar_feig/constants/app_colors.dart';
import 'package:eliachar_feig/ui_components/top_app_bar.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  AboutMeState createState() => AboutMeState();
}

class AboutMeState extends State<AboutMe> {
  String appVersion = "null";
  String appBuildNumber = "null";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getVersion(),
      builder: (BuildContext context, AsyncSnapshot<String> appVersion) {
        Widget widget;
        if (appVersion.hasData) {
          widget = Material(
            child: Scaffold(
              appBar: topAppBar(),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildTitle("About Me"),
                        Text(
                            """I’m a passionate software developer dedicated to building high-quality apps, web apps, and websites for iOS, Android, and the Web. I specialize in crafting modern, scalable, and user-friendly solutions using the latest technologies and frameworks. Whether it's a sleek mobile app, a dynamic web platform, or a full-stack system, I thrive on turning ideas into reality with clean code and intuitive designs. Always eager to stay ahead of industry trends, I ensure that every project I work on is optimized for performance, security, and user experience.\nLet’s build something amazing together!"""),
                        SizedBox(height: 16),
                        buildCard(
                          title: "Technical Skills",
                          sections: {
                            "Software": [
                              "Flutter & Dart, Swift/SwiftUI, C/C++, Python, Java, C#, Javascript + React.js",
                              "Object-Oriented Programming & Design",
                              "Design Patterns and SOLID Principles",
                              "Databases & Data Structures",
                              "Parallel Programming (C/C++)",
                              "Linux OS Environment",
                            ],
                            "Web": [
                              "JavaScript, Java, SQL",
                              "HTML, CSS, Bootstrap",
                              "Node.js, Express, React JS, Spring Boot",
                              "Backend + Frontend Web Development",
                              "UX/UI design sense",
                            ],
                          },
                        ),
                        SizedBox(height: 16),
                        buildCard(
                          title: "Soft Skills",
                          sections: {
                            "Characteristic": [
                              "Autodidact",
                              "Hard Working",
                              "Creative",
                              "Cooperative",
                              "Problem Solver",
                              "Stress Management",
                            ],
                            "Languages": [
                              "Hebrew - Native",
                              "French - Native",
                              "English - Fluent",
                            ],
                          },
                        ),
                      ],
                    ),
                  ),
                  // Show environment switching w/ password popup if supposed to...
                ],
              ),
            ),
          );
        } else {
          widget = Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return widget;
      },
    );
  }

  Widget buildTitle(String title) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 27.5, color: AppColors.hmDarkBlue),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  'App version: $appVersion ($appBuildNumber)',
                  style: TextStyle(fontSize: 12.5, color: AppColors.hmDarkBlue),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCard({
    required String title,
    required Map<String, List<String>> sections,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle(title),
            SizedBox(height: 8),
            ...sections.entries.map(
              (entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildCategory(entry.key),
                    ...entry.value.map((item) => buildBulletPoint(item)),
                    SizedBox(height: 8),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget buildCategory(String category) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 4),
      child: Text(
        category,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
      ),
    );
  }

  Widget buildBulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 12, bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("• ", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    appVersion = packageInfo.version;
    appBuildNumber = packageInfo.buildNumber;
    return appVersion;
  }
}
