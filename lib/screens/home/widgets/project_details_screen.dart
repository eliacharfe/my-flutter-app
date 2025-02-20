import 'package:eliachar_feig/model/project.dart';
import 'package:eliachar_feig/ui_components/extensions/widget_extensions.dart';
import 'package:eliachar_feig/ui_components/round_text_display.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project project;

  const ProjectDetailsScreen({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: Text(
          project.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
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
              RoundTextDisplay(
                text: "View on GitHub",
                bgColor: Color(0xFFE0F2F1),
                textColor: Colors.black,
                borderColor: Colors.black,
                isBold: true,
                icon: Icons.link,
                padding: EdgeInsets.all(5),
              ).onTapWithCursor(
                () async {
                  final Uri uri = Uri.parse(project.githubLink!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    throw 'Could not launch ${project.githubLink}';
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
