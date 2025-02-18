import 'package:eliachar_feig/model/project.dart';
import 'package:eliachar_feig/ui_components/extensions/widget_extensions.dart';
import 'package:eliachar_feig/ui_components/round_text_display.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProjectDetailsScreen extends StatelessWidget {
  final Project video;

  const ProjectDetailsScreen({super.key, required this.video});

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
          video.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (video.type == ProjectType.video)
              YoutubePlayer(
                controller: YoutubePlayerController(
                  initialVideoId: YoutubePlayer.convertUrlToId(video.videoUrl!)!,
                  flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
                ),
              ),
            if (video.type == ProjectType.image) Image.asset(video.imageAsset!, fit: BoxFit.cover),
            const SizedBox(height: 16),
            Text(
              video.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              video.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            if (video.githubLink != null)
              RoundTextDisplay(
                text: "View on GitHub",
                bgColor: Colors.white,
                textColor: Colors.black,
                borderColor: Colors.black,
                isBold: true,
                icon: Icons.link,
                padding: EdgeInsets.all(7),
              ).onTapWithCursor(
                () async {
                  final Uri uri = Uri.parse(video.githubLink!);
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri);
                  } else {
                    throw 'Could not launch ${video.githubLink}';
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
