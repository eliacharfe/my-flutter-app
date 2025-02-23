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

  static List<Project> projectsMockData = [
    Project(
      type: ProjectType.video,
      videoUrl: 'https://youtu.be/kyKP4AfDlYs',
      title: "Assemble Z' Army",
      description:
          'Real-Time Strategy multiplayer game online made in Unity engine. Coding with C#, using Mirror library',
      githubLink: 'https://github.com/eliacharfe/Assemble-Z-Army',
    ),
    Project(
      type: ProjectType.video,
      videoUrl: 'https://youtu.be/mfwwdH-bD9k',
      title: "Sonic",
      description:
          'Sonic Game coded with C++ at VS. The project was Object-Oriented Programming (OOP) and included the SFML library.',
      githubLink: 'https://github.com/eliacharfe/Sonic_GAME_OOP2_Project',
    ),
    Project(
      type: ProjectType.video,
      videoUrl: 'https://youtu.be/QmwvMqvJRSU',
      title: "Book Store Website",
      description:
          'A Book Store complete implementation responsive website using Spring Boot with Java at the Backend and JavaScript at the Frontend. The code uses Spring security, dealing with transactions, and the database is MySQL with APACHE Tomcat server via XAMPP',
      githubLink: 'https://github.com/Solange-s-Courses/ex4-spring-neviim-eliachar-feig-1.git',
    ),
    Project(
      type: ProjectType.image,
      imageAsset: "assets/images/structure.png",
      title: "HouseEye",
      description:
          'Know your home at real-time with HouseEye, secure your home, and direct chat between family members Backend: Firebase Cloud Database, Python, Flask, OpenCV, PIL, Twilio Frontend: JavaScript, HTML, CSS (Windows) Raspberry-Pi, Python, OpenCV, Raspberry-Pi camera (Linux)',
      githubLink: 'https://github.com/ExcellentTeam22/raspberry-pi-houseye-eliachar-yaniv-orel-or.git',
    ),
    Project(
      type: ProjectType.image,
      imageAsset: "assets/images/google.png",
      title: "Autocomplete",
      description:
          'Google Autocomplete Search Providing an autocomplete search for the user by developing an algorithm that takes into account possible spelling errors of the user. In addition, the algorithm takes into consideration memory and run-time limitations. Coded in Python.',
      githubLink: 'https://github.com/ExcellentTeam22/google-project-group-8',
    ),
    Project(
      type: ProjectType.image,
      imageAsset: "assets/images/mobileye.jpg",
      title: "Mobileye Project",
      description:
          'TFL Detection and Distance Estimation Detecting traffic lights within a given clip, estimating their distance from the vehicle using image processing technologies, Neural networks and SFM (Structure From Motion) for the distance estimation. Coded in Python.',
      githubLink: 'https://github.com/eliacharfe/Mobileye-Traffic-Lights-Project.git',
    ),
    Project(
      type: ProjectType.image,
      imageAsset: "assets/images/nasa.jpg",
      title: "NASA's Mars",
      description:
          "Manipulations on Mars photos using NASA API made with Node-js at the Backend and JavaScript at the Frontend. Uses sessions and user's Authentication. Database: Sqlite3.",
      githubLink: 'https://github.com/eliacharfe/nasa-api',
    ),
    Project(
      type: ProjectType.image,
      imageAsset: "assets/images/react.png",
      title: "Weather - React",
      description:
          "Showing weather for 7 next days by input location and show a forecast image of the next days - using the 7timer! API. Coded with React.js.",
      githubLink: 'https://github.com/eliacharfe/React---weather-website.git',
    ),
  ];
}
