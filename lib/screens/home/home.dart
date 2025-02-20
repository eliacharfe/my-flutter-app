import 'package:eliachar_feig/screens/home/packages/home_packages.dart';
import 'package:eliachar_feig/model/project.dart';
import '../../packages/default_packages.dart';
import '../../packages/ui_components_packages.dart';
import '../../packages/utlis_packages.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  final List<Project> projects = [
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
      title: "NASA's Mars Photos Website ",
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

  final List<String> notes = ['Note 1', 'Note 2'];

  void showDialogModal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.lightTeal,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
        contentTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 16,
        ),
        title: const Text('Dialog Modal'),
        content: const Text('This is a dialog modal in the center.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.teal,
            ),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void showBottomSheetModal() {
    PopupPresenter.showPopup(
      context: context,
      title: "Delete Item",
      message: "Are you sure do you want to delete this item?",
      primaryButtonTitle: "Cancel",
      secondaryButtonTitle: "Yes, Delete",
      onPrimaryAction: () {
        Navigator.of(context).pop();
      },
      onSecondaryAction: () async {
        setState(() {
          isLoading = true;
        });
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          isLoading = false;
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Item deleted Successfully')),
          );
        });
      },
      secondaryButtonColor: Colors.red.shade800,
    );
  }

  void editNote(int index) {
    final controller = TextEditingController(text: notes[index]);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Edit Note'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red.shade800,
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() => notes[index] = controller.text);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.teal,
            ),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void addNote() {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Add Note'),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red.shade800,
            ),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() => notes.add(controller.text));
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.teal,
            ),
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: WidgetStyling.buildTopAppBar(title: "Home"),
      endDrawer: DrawersMobile(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSection(
                title: 'Projects (${projects.length})',
                child: buildProjectsContent(),
                onTap: () {
                  Navigator.of(context).push(
                    RouteWrapper(
                      page: ProjectsScreen(projects: projects),
                    ),
                  );
                },
              ),
              buildSection(
                title: 'Modal Buttons',
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: showDialogModal,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightTeal,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text('Dialog Modal'),
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: showBottomSheetModal,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.lightTeal,
                            foregroundColor: Colors.black,
                          ),
                          child: const Text('Bottom Sheet'),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap: null,
              ),
              buildSection(
                title: 'Notes Section',
                rightIcon: Icons.add,
                child: Column(
                  children: [
                    ...notes.asMap().entries.map(
                          (entry) => ListTile(
                            title: Text(entry.value),
                            trailing: const Icon(Icons.edit),
                            onTap: () => editNote(entry.key),
                          ),
                        ),
                    const SizedBox(height: 8),
                  ],
                ),
                onTap: addNote,
              ),
              buildSection(
                title: 'Achievements',
                child: Wrap(
                  spacing: 10,
                  children: List.generate(4, (index) {
                    return Chip(
                      label: Text('Achievement ${index + 1}'),
                      backgroundColor: AppColors.lightTeal,
                    );
                  }),
                ),
                onTap: () {},
              ),
              buildSection(
                title: 'Learning Progress',
                rightIcon: null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Flutter Mastery"),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.8,
                      backgroundColor: Colors.grey,
                      color: Colors.tealAccent,
                    ),
                  ],
                ).withPadding(EdgeInsets.symmetric(horizontal: 16)),
                onTap: null,
              ),
              buildSection(
                title: 'Empty Section',
                rightIcon: null,
                child: const Center(
                  child: Text(
                    'There is no data to display.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: null,
              ),
              buildSection(
                title: 'Upcoming Events',
                child: Column(
                  children: List.generate(3, (index) {
                    return ListTile(
                      leading: const Icon(Icons.event),
                      title: Text('Event ${index + 1}'),
                      subtitle: const Text('Event description...'),
                      trailing: const Icon(Icons.chevron_right),
                      onTap: () {},
                    );
                  }),
                ),
                onTap: () {},
              ),
            ],
          ),
        ).isLoading(isLoading: isLoading),
      ),
    );
  }

  Widget buildProjectsContent() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: projects.take(2).map(
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
    );
  }

  Widget buildSection({
    required String title,
    required Widget child,
    IconData? rightIcon,
    required VoidCallback? onTap,
  }) {
    return Column(
      children: [
        SectionTitle(
          title: title,
          rightIcon: (onTap != null) ? (rightIcon ?? Icons.chevron_right) : null,
          onPressedRightIcon: onTap,
        ),
        SizedBox(height: 16),
        child,
        SizedBox(height: 20),
        Divider(),
      ],
    );
  }
}
