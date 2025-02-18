enum ProjectType { video, image }

class Project {
  final ProjectType type;
  final String? videoUrl;
  final String? imageAsset;
  final String title;
  final String description;
  final String? githubLink;

  Project({
    required this.type,
    this.videoUrl,
    this.imageAsset,
    required this.title,
    required this.description,
    this.githubLink,
  });
}
