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
              backgroundColor: context.scaffoldColor,
              appBar: widget.showAppBar ? WidgetStyling.buildTopAppBar(title: 'about_me'.translate(context)) : null,
              endDrawer: DrawersMobile(),
              body: Stack(
                children: [
                  SingleChildScrollView(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        buildTitle("about_me".translate(context), context).withAnimation(),
                        Sans("about_me_description".translate(context), 14).withAnimation(),
                        SizedBox(height: 16),
                        AnimatedBulletPointsCard(
                          title: "technical_skills".translate(context),
                          sections: {
                            "software".translate(context): [
                              "flutter_and_dart".translate(context),
                              "object_oriented_programming".translate(context),
                              "design_patterns_and_solid".translate(context),
                              "databases_and_data_structures".translate(context),
                              "parallel_programming".translate(context),
                              "macos_windows_linux_environments".translate(context),
                            ],
                            "web".translate(context): [
                              "flutter_js_java_sql".translate(context),
                              "html_css_bootstrap".translate(context),
                              "node_express_react_springboot".translate(context),
                              "backend_frontend_web_dev".translate(context),
                              "ux_ui_design_sense".translate(context),
                            ],
                          },
                        ),
                        SizedBox(height: 16),
                        AnimatedBulletPointsCard(
                          title: "soft_skills".translate(context),
                          sections: {
                            "characteristics".translate(context): [
                              "autodidact".translate(context),
                              "hard_working".translate(context),
                              "creative".translate(context),
                              "cooperative".translate(context),
                              "problem_solver".translate(context),
                              "stress_management".translate(context),
                            ],
                            "languages".translate(context): [
                              "hebrew_native".translate(context),
                              "french_native".translate(context),
                              "english_fluent".translate(context),
                            ],
                          },
                        ),
                      ],
                    ),
                  ),
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

  Widget buildTitle(String title, BuildContext context) {
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
                Sans("${'app_version'.translate(context)}: $appVersion ($appBuildNumber)", 12.5),
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
              Text(
                'software_developer'.translate(context),
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                'bsc_computer_science'.translate(context),
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
