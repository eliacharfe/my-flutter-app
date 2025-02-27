import 'package:eliachar_feig/models/project.dart';
import '../../../packages/default_packages.dart';
import '../../../packages/utlis_packages.dart';

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

  static Widget buildImageDisplay(Project project, {double? maxHeight}) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight ?? double.infinity,
      ),
      child: Center(
        child: Image.asset(
          project.imageAsset!,
          fit: BoxFit.cover,
        ),
      ),
    );
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
            style: GoogleFonts.openSans(fontSize: 12),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
