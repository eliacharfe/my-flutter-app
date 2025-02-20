import 'package:eliachar_feig/model/project.dart';
import 'package:eliachar_feig/utils/components.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomeHelper {
  static Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      debugPrint("launch: $url");
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Widget buildVideoPlayer(Project project) {
    final videoId = YoutubePlayer.convertUrlToId(project.videoUrl!);
    if (videoId == null) {
      return const Text('Invalid Video URL');
    }
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
      ),
    );
  }

  static Widget buildImageDisplay(Project project) {
    return Image.asset(project.imageAsset!, fit: BoxFit.cover);
  }

  static Widget buildITextSection(Project project) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SansBold(project.title, 14),
          const SizedBox(height: 4),
          Text(
            project.description,
            style: const TextStyle(fontSize: 12),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
