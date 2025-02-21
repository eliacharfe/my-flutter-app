import 'package:eliachar_feig/models/note.dart';
import 'package:eliachar_feig/models/to_do.dart';
import 'package:eliachar_feig/screens/home/packages/home_packages.dart';
import 'package:eliachar_feig/models/project.dart';
import 'package:eliachar_feig/screens/home/widgets/all_to_dos_screen.dart';
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

  @override
  void dispose() {
    super.dispose();
  }

  void showDialogModal({String? title, String? text}) {
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
        title: Text(title ?? 'Dialog Modal'),
        content: Text(text ?? 'This is a dialog modal in the center.'),
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

  void showBottomSheetModalTodo(int index) {
    final toDoNotifier = Provider.of<ToDoNotifier>(context, listen: false);

    PopupPresenter.showPopup(
      context: context,
      title: "Delete Item",
      message: "Are you sure you want to delete this item?",
      primaryButtonTitle: "Cancel",
      secondaryButtonTitle: "Yes, Delete",
      onPrimaryAction: () {
        Navigator.of(context).pop();
      },
      onSecondaryAction: () async {
        setState(() => isLoading = true);
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          isLoading = false;
          toDoNotifier.removeToDo(index);
          Navigator.of(context).pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Item deleted successfully')),
          );
        });
      },
      secondaryButtonColor: AppColors.red,
    );
  }

  void markToDoAsComplete(int index) {
    final toDoNotifier = Provider.of<ToDoNotifier>(context, listen: false);
    setState(() {
      toDoNotifier.todos[index].isCompleted = true;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${toDoNotifier.todos[index].title} marked as completed}')),
      );
    });
  }

  void editNote(String id) {
    final note = context.read<NoteNotifier>().notes.firstWhere((note) => note.id == id);
    final controller = TextEditingController(text: note.text);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Edit Note').applySansStyle(size: 24, fontWeight: FontWeight.w500),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel').applySansStyle(color: AppColors.red, fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              context.read<NoteNotifier>().editNoteById(id, controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save').applySansStyle(fontWeight: FontWeight.w600, color: Colors.teal),
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
        title: const Text('Add Note').applySansStyle(size: 24, fontWeight: FontWeight.w500),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel').applySansStyle(color: AppColors.red, fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              context.read<NoteNotifier>().addNote(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Add').applySansStyle(fontWeight: FontWeight.w600, color: Colors.teal),
          ),
        ],
      ),
    );
  }

  void addToDo() {
    final controller = TextEditingController();
    final toDoNotifier = Provider.of<ToDoNotifier>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: const Text('Add To-Do').applySansStyle(size: 24, fontWeight: FontWeight.w500),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel').applySansStyle(color: AppColors.red, fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              toDoNotifier.addToDo('New To-Do Item');
              Navigator.pop(context);
            },
            child: const Text('Add').applySansStyle(fontWeight: FontWeight.w600, color: Colors.teal),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final noteNotifier = Provider.of<NoteNotifier>(context);
    final toDoNotifier = Provider.of<ToDoNotifier>(context);

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
                title: 'Projects (${Project.projectsMockData.length})',
                child: buildProjectsContent(),
                onTap: () {
                  Navigator.of(context).push(
                    RouteWrapper(
                      page: ProjectsScreen(projects: Project.projectsMockData),
                    ),
                  );
                },
              ),
              buildSection(
                title: 'Notes Section',
                rightIcon: Icons.add,
                child: noteNotifier.notes.isEmpty
                    ? WidgetStyling.getNoDataContainerWith("There is no Notes to display")
                    : Column(
                        children: [
                          ...noteNotifier.notes.map(
                            (note) {
                              return Dismissible(
                                // key: ValueKey(entry.value),
                                key: ValueKey(note.id),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  setState(() {
                                    context.read<NoteNotifier>().removeNoteById(note.id);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Note deleted successfully')),
                                    );
                                  });
                                },
                                background: Container(
                                  color: AppColors.red,
                                  alignment: Alignment.centerRight,
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                                child: ListTile(
                                  title: Text(note.text),
                                  trailing: const Icon(Icons.edit),
                                  onTap: () => editNote(note.id),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                onTap: addNote,
              ),
              buildSection(
                title: 'To-Do List',
                rightIcon: Icons.add,
                child: toDoNotifier.todos.isEmpty
                    ? WidgetStyling.getNoDataContainerWith("There is no to dos to display")
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ...toDoNotifier.todos.take(2).map((todo) {
                            int index = toDoNotifier.todos.indexOf(todo);
                            String title = todo.title;
                            bool isCompleted = todo.isCompleted;

                            return ListTile(
                              title: Text(title),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                spacing: 0,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      isCompleted ? Icons.check_circle : Icons.check_circle_outline,
                                      color: isCompleted ? Colors.green.shade700 : Colors.grey,
                                    ),
                                    onPressed: isCompleted ? null : () => markToDoAsComplete(index),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: AppColors.red),
                                    onPressed: () => showBottomSheetModalTodo(index),
                                  ),
                                ],
                              ),
                            );
                          }),
                          if (toDoNotifier.todos.length > 2)
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AllToDosScreen(),
                                  ),
                                );
                              },
                              child: Text('Show All Todos').applySansStyle(color: Colors.teal),
                            ).withPadding(EdgeInsets.only(right: 20)),
                        ],
                      ),
                onTap: addToDo,
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
                ).onTapWithCursor(() {
                  showDialogModal(
                      title: 'Achievement', text: 'This is a dialog modal in the center for Achievement 🚀.');
                }),
                onTap: () {},
              ),
              buildSection(
                title: 'Progress',
                rightIcon: null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Flutter Mastery"),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.82,
                      backgroundColor: Colors.grey,
                      color: Colors.tealAccent,
                    ),
                    SizedBox(height: 12),
                    const Text("iOS Development"),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.93,
                      backgroundColor: Colors.grey,
                      color: Colors.tealAccent,
                    ),
                    SizedBox(height: 12),
                    const Text("Android Development"),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.71,
                      backgroundColor: Colors.grey,
                      color: Colors.tealAccent,
                    ),
                    SizedBox(height: 12),
                    const Text("Firebase App Integration"),
                    const SizedBox(height: 8),
                    LinearProgressIndicator(
                      value: 0.75,
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
                title: 'Unable To Load',
                rightIcon: null,
                child: WidgetStyling.getUnableToLoadContainer(),
                onTap: null,
              ),
              buildSection(
                title: 'Custom Unable To Load',
                rightIcon: null,
                child: WidgetStyling.getNoDataContainerWith("No data available right now"),
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
      children: Project.projectsMockData.take(2).map(
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
