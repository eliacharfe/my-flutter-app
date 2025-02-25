import 'package:eliachar_feig/models/project.dart';
import 'package:eliachar_feig/ui_components/wide_rect_button.dart';
import '../../../packages/default_packages.dart';
import '../../../packages/ui_components_packages.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;

    return Scaffold(
      backgroundColor: context.scaffoldColor,
      appBar: WidgetStyling.buildTopAppBar(title: project.title, showLogoIcon: false),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.type == ProjectType.video)
              YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(project.videoUrl!)!,
                  flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
                ),
              ),
            if (project.type == ProjectType.image) Image.asset(project.imageAsset!, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              project.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              project.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            if (project.githubLink != null)
              WideRectButton(
                text: "view_on_github".translate(context),
                textColor: isDarkMode ? Colors.black : Colors.white,
                borderColor: isDarkMode ? Colors.white : Colors.black,
                bgColor: isDarkMode ? Colors.white : Colors.black,
                onPressed: () async {
                  final Uri uri = Uri.parse(project.githubLink!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    throw 'Could not launch ${project.githubLink}';
                  }
                },
              )
          ],
        ),
      ).withAnimation(),
    );
  }
}
