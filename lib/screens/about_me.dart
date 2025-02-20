import '../packages/default_packages.dart';
import '../packages/ui_components_packages.dart';
import '../packages/utlis_packages.dart';

class AboutMe extends StatefulWidget {
  final bool showAppBar;
  const AboutMe({super.key, this.showAppBar = true});

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
        Widget childWidget;
        if (appVersion.hasData) {
          childWidget = Material(
            child: Scaffold(
              backgroundColor: AppColors.scaffoldColor,
              appBar: widget.showAppBar ? WidgetStyling.buildTopAppBar(title: 'About Me') : null,
              endDrawer: DrawersMobile(),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildTitle("About Me"),
                        Sans(
                            """I’m a passionate software developer dedicated to building high-quality apps, web apps, and websites for iOS, Android, and the Web. I specialize in crafting modern, scalable, and user-friendly solutions using the latest technologies and frameworks. Whether it's a sleek mobile app, a dynamic web platform, or a full-stack system, I thrive on turning ideas into reality with clean code and intuitive designs. Always eager to stay ahead of industry trends, I ensure that every project I work on is optimized for performance, security, and user experience.\nLet’s build something amazing together! 🔥""",
                            14),
                        SizedBox(height: 16),
                        AnimatedBulletPointsCard(
                          title: "Technical Skills",
                          sections: {
                            "Software": [
                              "Flutter & Dart, Swift/SwiftUI, C/C++, Python, Java, C#, Javascript + React.js",
                              "Object-Oriented Programming & Design",
                              "Design Patterns and SOLID Principles",
                              "Databases & Data Structures",
                              "Parallel Programming (C/C++)",
                              "Mac, Windows, Linux Environments",
                            ],
                            "Web": [
                              "Flutter, JavaScript, Java, SQL",
                              "HTML, CSS, Bootstrap",
                              "Node.js, Express, React JS, Spring Boot",
                              "Backend + Frontend Web Development",
                              "UX/UI design sense",
                            ],
                          },
                        ),
                        SizedBox(height: 16),
                        AnimatedBulletPointsCard(
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
          childWidget = Container(
            color: Colors.white,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return childWidget;
      },
    );
  }

  Widget buildTitle(String title) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SansBold(title, 27.5),
                Sans('App version: $appVersion ($appBuildNumber)', 12.5),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            children: [
              CircleAvatar(
                radius: 37,
                backgroundColor: Colors.tealAccent,
                child: const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage('assets/images/profile.jpeg'),
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Software Developer',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              const Text(
                'B.Sc Computer Science',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
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
