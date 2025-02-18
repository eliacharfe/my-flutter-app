enum VideoCardType { video, image }

class VideoData {
  final VideoCardType type;
  final String? videoUrl;
  final String? imageAsset;
  final String title;
  final String description;
  final String? githubLink;

  VideoData({
    required this.type,
    this.videoUrl,
    this.imageAsset,
    required this.title,
    required this.description,
    this.githubLink,
  });
}
