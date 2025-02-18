import 'package:eliachar_feig/model/video_data.dart';
import 'package:eliachar_feig/screens/home/widgets/video_card.dart';
import 'package:eliachar_feig/ui_components/extensions/build_context_extensions.dart';
import 'package:eliachar_feig/ui_components/extensions/widget_extensions.dart';
import 'package:eliachar_feig/ui_components/round_text_display.dart';
import 'package:flutter/material.dart';
import 'package:eliachar_feig/ui_components/top_app_bar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  final List<VideoData> videos = [
    VideoData(
      type: VideoCardType.video,
      videoUrl: 'https://youtu.be/kyKP4AfDlYs',
      title: "Assemble Z' Army",
      description:
          'Real-Time Strategy multiplayer game online made in Unity engine. Coding with C#, using Mirror library',
      githubLink: 'https://github.com/eliacharfe/Assemble-Z-Army',
    ),
    VideoData(
      type: VideoCardType.video,
      videoUrl: 'https://youtu.be/mfwwdH-bD9k',
      title: "Sonic",
      description:
          'Sonic Game coded with C++ at VS. The project was Object-Oriented Programming (OOP) and included the SFML library.',
      githubLink: 'https://github.com/eliacharfe/Sonic_GAME_OOP2_Project',
    ),
    VideoData(
      type: VideoCardType.video,
      videoUrl: 'https://youtu.be/QmwvMqvJRSU',
      title: "Book Store Website",
      description:
          'A Book Store complete implementation responsive website using Spring Boot with Java at the Backend and JavaScript at the Frontend. The code uses Spring security, dealing with transactions, and the database is MySQL with APACHE Tomcat server via XAMPP',
      githubLink: 'https://github.com/Solange-s-Courses/ex4-spring-neviim-eliachar-feig-1.git',
    ),
    VideoData(
      type: VideoCardType.image,
      imageAsset: "assets/images/structure.png",
      title: "HousEye - Raspberry-Pi Project",
      description:
          'Know your home at real-time with HousEye, secure your home, and direct chat between family members Backend: Firebase Cloud Database, Python, Flask, OpenCV, PIL, Twilio Frontend: JavaScript, HTML, CSS (Windows) Raspberry-Pi, Python, OpenCV, Raspberry-Pi camera (Linux)',
      githubLink: 'https://github.com/ExcellentTeam22/raspberry-pi-houseye-eliachar-yaniv-orel-or.git',
    ),
    VideoData(
      type: VideoCardType.image,
      imageAsset: "assets/images/google.png",
      title: "Google Autocomplete Project",
      description:
          'Autocomplete Search Providing an autocomplete search for the user by developing an algorithm that takes into account possible spelling errors of the user. In addition, the algorithm takes into consideration memory and run-time limitations. Coded in Python.',
      githubLink: 'https://github.com/ExcellentTeam22/google-project-group-8',
    ),
    VideoData(
      type: VideoCardType.image,
      imageAsset: "assets/images/mobileye.jpg",
      title: "Mobileye Project",
      description:
          'TFL Detection and Distance Estimation Detecting traffic lights within a given clip, estimating their distance from the vehicle using image processing technologies, Neural networks and SFM (Structure From Motion) for the distance estimation. Coded in Python.',
      githubLink: 'https://github.com/eliacharfe/Mobileye-Traffic-Lights-Project.git',
    ),
    VideoData(
      type: VideoCardType.image,
      imageAsset: "assets/images/nasa.jpg",
      title: "NASA's Mars Photos Website Project",
      description:
          "Manipulations on Mars photos using NASA API made with Node-js at the Backend and JavaScript at the Frontend. Uses sessions and user's Authentication. Database: Sqlite3.",
      githubLink: 'https://github.com/eliacharfe/nasa-api',
    ),
    VideoData(
      type: VideoCardType.image,
      imageAsset: "assets/images/react.png",
      title: "Weather - React Project",
      description:
          "Showing weather for 7 next days by input location and show a forecast image of the next days - using the 7timer! API. Coded with React.js.",
      githubLink: 'https://github.com/eliacharfe/React---weather-website.git',
    ),
  ];

  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      debugPrint("launch: $url");
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(248, 248, 248, 1.0),
      appBar: topAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Projects',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ).withPadding(EdgeInsets.symmetric(horizontal: 15)),
              SizedBox(height: 16),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: videos.map((video) {
                  return VideoCard(
                    width: (context.screenWidth - 30) / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (video.type == VideoCardType.video)
                          buildVideoPlayer(video)
                        else if (video.type == VideoCardType.image)
                          buildImageDisplay(video),
                        buildITextSection(video),
                        if (video.githubLink != null)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RoundTextDisplay(
                              text: "GitHub",
                              bgColor: Colors.black,
                              textColor: Colors.white,
                              isBold: false,
                            ).onTapWithCursor(
                              () {
                                if (video.githubLink != null && video.githubLink!.isNotEmpty) {
                                  launchURL(video.githubLink!);
                                }
                              },
                            ),
                          ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildVideoPlayer(VideoData video) {
    final videoId = YoutubePlayer.convertUrlToId(video.videoUrl!);
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

  Widget buildImageDisplay(VideoData video) {
    return Image.asset(video.imageAsset!, fit: BoxFit.cover);
  }

  Widget buildITextSection(VideoData video) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            video.title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            video.description,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
