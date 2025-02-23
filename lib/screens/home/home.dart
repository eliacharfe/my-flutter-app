import 'package:eliachar_feig/models/note.dart';
import 'package:eliachar_feig/models/to_do.dart';
import 'package:eliachar_feig/screens/home/packages/home_packages.dart';
import 'package:eliachar_feig/models/project.dart';
import 'package:eliachar_feig/screens/home/widgets/all_to_dos_screen.dart';
import 'package:eliachar_feig/ui_components/wide_rect_button.dart';
import '../../packages/default_packages.dart';
import '../../packages/ui_components_packages.dart';
import '../../packages/utlis_packages.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeContentState();
}

class _HomeContentState extends State<Home> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final noteNotifier = Provider.of<NoteNotifier>(context);
    final toDoNotifier = Provider.of<ToDoNotifier>(context);
    final isDarkMode = context.isDarkMode;

    return Scaffold(
      backgroundColor: context.scaffoldColor,
      appBar: WidgetStyling.buildTopAppBar(title: "Home"),
      endDrawer: DrawersMobile().withAnimation(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSection(
                title: 'Projects (${Project.projectsMockData.length})',
                child: buildProjectsContent(isDarkMode),
                isDarkMode: isDarkMode,
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
                isDarkMode: isDarkMode,
                child: noteNotifier.notes.isEmpty
                    ? WidgetStyling.getNoDataContainerWith(
                        "There is no Notes to display",
                        isDarkMode: isDarkMode,
                      )
                    : Column(
                        children: [
                          ...noteNotifier.notes.map(
                            (note) {
                              return Dismissible(
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
                                  onTap: () => editNote(note.id, isDarkMode),
                                ),
                              );
                            },
                          ),
                          const SizedBox(height: 8),
                        ],
                      ),
                onTap: () {
                  addNote(isDarkMode);
                },
              ).withAnimation(),
              buildSection(
                title: 'To-Do List',
                rightIcon: Icons.add,
                isDarkMode: isDarkMode,
                child: toDoNotifier.todos.isEmpty
                    ? WidgetStyling.getNoDataContainerWith(
                        "There is no to dos to display",
                        isDarkMode: isDarkMode,
                      )
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
                                      color: isCompleted
                                          ? (isDarkMode ? Colors.white : Colors.green.shade700)
                                          : Colors.grey,
                                    ),
                                    onPressed: () => toggleMarkToDoAsComplete(index),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.delete, color: isDarkMode ? Colors.white : AppColors.red),
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
                                  RouteWrapper(
                                    page: AllToDosScreen(),
                                  ),
                                );
                              },
                              child:
                                  Text('Show All Todos').applySansStyle(color: isDarkMode ? Colors.white : Colors.teal),
                            ).withPadding(EdgeInsets.only(right: 20)),
                        ],
                      ),
                onTap: addToDo,
              ).withAnimation(),
              buildSection(
                title: 'Achievements',
                isDarkMode: isDarkMode,
                child: Wrap(
                  spacing: 10,
                  children: List.generate(4, (index) {
                    return Chip(
                      label: Text('Achievement ${index + 1}'),
                      backgroundColor: isDarkMode ? Colors.grey.shade700 : AppColors.lightTeal,
                    );
                  }),
                ).onTapWithCursor(() {
                  showDialogModal(
                    title: 'Achievement',
                    text: 'This is a dialog modal in the center for Achievement 🚀.',
                    isDarkMode: isDarkMode,
                  );
                }),
                onTap: () {},
              ).withAnimation(),
              buildSection(
                title: 'Progress',
                rightIcon: null,
                isDarkMode: isDarkMode,
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
              ).withAnimation(),
              buildSection(
                title: 'Empty Section',
                rightIcon: null,
                isDarkMode: isDarkMode,
                child: const Center(
                  child: Text(
                    'There is no data to display.',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: null,
              ).withAnimation(),
              buildSection(
                title: 'Unable To Load',
                rightIcon: null,
                isDarkMode: isDarkMode,
                child: WidgetStyling.getUnableToLoadContainer(isDarkMode: isDarkMode),
                onTap: null,
              ),
              buildSection(
                title: 'Custom Unable To Load',
                rightIcon: null,
                isDarkMode: isDarkMode,
                child: WidgetStyling.getNoDataContainerWith("No data available right now", isDarkMode: isDarkMode),
                onTap: null,
              ),
              buildSection(
                title: 'Upcoming Events',
                isDarkMode: isDarkMode,
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

  void showDialogModal({String? title, String? text, required bool isDarkMode}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode ? AppColors.darkGray : AppColors.lightTeal,
        titleTextStyle: TextStyle(
          color: isDarkMode ? Colors.white : Colors.black,
          fontSize: 20,
        ),
        contentTextStyle: TextStyle(
          color: isDarkMode ? Colors.grey.shade200 : Colors.black87,
          fontSize: 16,
        ),
        title: Text(title ?? 'Dialog Modal'),
        content: Text(text ?? 'This is a dialog modal in the center.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              foregroundColor: isDarkMode ? Colors.grey.shade50 : Colors.teal,
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

  void toggleMarkToDoAsComplete(int index) {
    final toDoNotifier = Provider.of<ToDoNotifier>(context, listen: false);
    final todo = toDoNotifier.todos[index];
    setState(() {
      todo.isCompleted = !todo.isCompleted;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${todo.title} ${todo.isCompleted ? " " : " un"}marked as completed')),
      );
    });
  }

  void editNote(String id, bool isDarkMode) {
    final note = context.read<NoteNotifier>().notes.firstWhere((note) => note.id == id);
    final controller = TextEditingController(text: note.text);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode ? AppColors.darkGray : Colors.white,
        title: const Text('Edit Note').applySansStyle(size: 24, fontWeight: FontWeight.w500),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')
                .applySansStyle(color: isDarkMode ? Colors.red : AppColors.red, fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              context.read<NoteNotifier>().editNoteById(id, controller.text);
              Navigator.pop(context);
            },
            child: const Text('Save')
                .applySansStyle(fontWeight: FontWeight.w600, color: isDarkMode ? Colors.white : Colors.teal),
          ),
        ],
      ),
    );
  }

  void addNote(bool isDarkMode) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode ? AppColors.darkGray : Colors.white,
        title: const Text('Add Note').applySansStyle(size: 24, fontWeight: FontWeight.w500),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel')
                .applySansStyle(color: isDarkMode ? Colors.red : AppColors.red, fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              context.read<NoteNotifier>().addNote(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Add')
                .applySansStyle(fontWeight: FontWeight.w600, color: isDarkMode ? Colors.white : Colors.teal),
          ),
        ],
      ),
    );
  }

  void addToDo() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.isDarkMode ? AppColors.darkGray : Colors.white,
        title: const Text('Add To-Do').applySansStyle(size: 24, fontWeight: FontWeight.w500),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel').applySansStyle(color: AppColors.red, fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              context.read<ToDoNotifier>().addToDo(controller.text);
              Navigator.pop(context);
            },
            child: const Text('Add').applySansStyle(
              fontWeight: FontWeight.w600,
              color: context.isDarkMode ? Colors.white : Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildProjectsContent(bool isDarkMode) {
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
                    child: WideRectButton(
                      text: "GitHub",
                      bgColor: isDarkMode ? Colors.white : Colors.teal.shade200,
                      textColor: isDarkMode ? Colors.black : Colors.black,
                      borderColor: isDarkMode ? Colors.black : Colors.black,
                      onPressed: () async {
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
    required bool isDarkMode,
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
        Divider(
          color: isDarkMode ? Colors.white : AppColors.dividerColor,
        ),
      ],
    );
  }
}
