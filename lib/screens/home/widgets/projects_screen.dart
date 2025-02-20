import 'package:eliachar_feig/model/project.dart';
import 'package:eliachar_feig/screens/home/helpers/home_helper.dart';
import 'package:eliachar_feig/screens/home/widgets/project_card.dart';
import 'package:eliachar_feig/screens/home/widgets/project_details_screen.dart';
import 'package:eliachar_feig/ui_components/extensions/build_context_extensions.dart';
import 'package:eliachar_feig/ui_components/extensions/widget_extensions.dart';
import 'package:eliachar_feig/ui_components/round_text_display.dart';
import 'package:eliachar_feig/ui_components/route_wrapper.dart';
import 'package:eliachar_feig/ui_components/styling/widget_styling.dart';
import 'package:eliachar_feig/utils/app_colors.dart';
import 'package:eliachar_feig/utils/components.dart';
import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  final bool showLogoIcon;
  final List<Project> projects;

  const ProjectsScreen({super.key, required this.projects, this.showLogoIcon = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
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
                      height: 280,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (project.type == ProjectType.video)
                            HomeHelper.buildVideoPlayer(project)
                          else if (project.type == ProjectType.image)
                            HomeHelper.buildImageDisplay(project),
                          HomeHelper.buildITextSection(project),
                          Spacer(),
                          if (project.githubLink != null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RoundTextDisplay(
                                text: "GitHub",
                                bgColor: Colors.black,
                                textColor: Colors.white,
                                isBold: false,
                                icon: Icons.link,
                                iconSize: 15,
                                padding: EdgeInsets.all(2),
                              ).onTapWithCursor(
                                () {
                                  if (project.githubLink != null && project.githubLink!.isNotEmpty) {
                                    HomeHelper.launchURL(project.githubLink!);
                                  }
                                },
                              ),
                            ),
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
        ),
      ),
    );
  }
}
