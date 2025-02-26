import 'package:eliachar_feig/models/project.dart';
import 'package:eliachar_feig/ui_components/wide_rect_button.dart';
import '../../../packages/default_packages.dart';
import '../../../packages/ui_components_packages.dart';
import '../packages/home_packages.dart';

class ProjectsScreen extends StatelessWidget {
  final bool showLogoIcon;
  final List<Project> projects;

  const ProjectsScreen({super.key, required this.projects, this.showLogoIcon = false});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return Scaffold(
      backgroundColor: context.scaffoldColor,
      appBar: WidgetStyling.buildTopAppBar(title: "Projects", showLogoIcon: showLogoIcon),
      endDrawer: DrawersMobile(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: projects.map(
                  (project) {
                    return ProjectCard(
                      width: (context.screenWidth - 30) / 2,
                      height: 290,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (project.type == ProjectType.video)
                            HomeHelper.buildVideoPlayer(project)
                          else if (project.type == ProjectType.image)
                            HomeHelper.buildImageDisplay(project, maxHeight: 90),
                          HomeHelper.buildITextSection(project),
                          Spacer(),
                          if (project.githubLink != null)
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: WideRectButton(
                                  text: "GitHub",
                                  bgColor: isDarkMode ? Colors.white : Colors.teal.shade200,
                                  textColor: isDarkMode ? Colors.black : Colors.black,
                                  borderColor: isDarkMode ? Colors.black : Colors.black,
                                  onPressed: () async {
                                    if (project.githubLink != null && project.githubLink!.isNotEmpty) {
                                      HomeHelper.launchURL(project.githubLink!);
                                    }
                                  },
                                )),
                        ],
                      ),
                    ).onTapWithCursor(
                      () {
                        Navigator.of(context).push(
                          RouteWrapper(
                            page: ProjectDetailsScreen(project: project),
                          ),
                        );
                      },
                    );
                  },
                ).toList(),
              )
            ],
          ),
        ).withAnimation(),
      ),
    );
  }
}

// RoundTextDisplay(
//   text: "GitHub",
//   bgColor: Colors.black,
//   textColor: Colors.white,
//   isBold: false,
//   icon: Icons.link,
//   iconSize: 15,
//   padding: EdgeInsets.all(2),
// ).onTapWithCursor(
//   () {
//     if (project.githubLink != null && project.githubLink!.isNotEmpty) {
//       HomeHelper.launchURL(project.githubLink!);
//     }
//   },
// ),
