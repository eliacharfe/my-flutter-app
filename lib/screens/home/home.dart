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
      appBar: WidgetStyling.buildTopAppBar(title: "home_title".translate(context)),
      endDrawer: DrawersMobile().withAnimation(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSection(
                title: '${'Projects'.translate(context)} (${Project.projectsMockData.length})',
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
                title: 'notes_title'.translate(context),
                rightIcon: Icons.add,
                isDarkMode: isDarkMode,
                child: noteNotifier.notes.isEmpty
                    ? WidgetStyling.getNoDataContainerWith(
                        "home_no_notes".translate(context),
                        // "There is no Notes to display",
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
                                      SnackBar(content: Text('note_deleted'.translate(context))),
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
                title: 'todos_title'.translate(context),
                rightIcon: Icons.add,
                isDarkMode: isDarkMode,
                child: toDoNotifier.todos.isEmpty
                    ? WidgetStyling.getNoDataContainerWith(
                        "home_no_todos".translate(context),
                        // "There is no to dos to display",
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
                                    onPressed: () => showBottomSheetModalTodo(context, index),
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
                              child: Text('show_all_todos'.translate(context))
                                  .applySansStyle(color: isDarkMode ? Colors.white : Colors.teal),
                            ).withPadding(EdgeInsets.only(right: 20)),
                        ],
                      ),
                onTap: addToDo,
              ).withAnimation(),
              buildSection(
                title: 'achievement_title'.translate(context),
                isDarkMode: isDarkMode,
                child: Wrap(
                  spacing: 10,
                  children: List.generate(4, (index) {
                    return Chip(
                      label: Text('${'Achievement'.translate(context)} ${index + 1}'),
                      backgroundColor: isDarkMode ? Colors.grey.shade700 : AppColors.lightTeal,
                    );
                  }),
                ).onTapWithCursor(() {
                  showDialogModal(
                    context,
                    title: 'Achievement'.translate(context),
                    text: 'achievement_dialog_description'.translate(context),
                    isDarkMode: isDarkMode,
                  );
                }),
                onTap: () {},
              ).withAnimation(),
              buildSection(
                title: 'Progress'.translate(context),
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
                title: 'empty_section_title'.translate(context),
                rightIcon: null,
                isDarkMode: isDarkMode,
                child: Center(
                  child: Text(
                    'empty_section'.translate(context),
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                onTap: null,
              ).withAnimation(),
              buildSection(
                title: 'unable_to_load_title'.translate(context),
                rightIcon: null,
                isDarkMode: isDarkMode,
                child: WidgetStyling.getUnableToLoadContainer(
                    text: 'unable_to_load'.translate(context), isDarkMode: isDarkMode),
                onTap: null,
              ),
              buildSection(
                title: 'customized_no_data'.translate(context),
                rightIcon: null,
                isDarkMode: isDarkMode,
                child: WidgetStyling.getNoDataContainerWith("No data available right now", isDarkMode: isDarkMode),
                onTap: null,
              ),
              buildSection(
                title: 'upcoming_events'.translate(context),
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

  void showDialogModal(BuildContext context, {String? title, String? text, required bool isDarkMode}) {
    PopupPresenter.showCustomDialog(
        context: context,
        isDarkMode: isDarkMode,
        title: title ?? 'dialog_modal_title'.translate(context),
        message: 'dialog_modal_content'.translate(context));
  }

  void showBottomSheetModalTodo(BuildContext context, int index) {
    final toDoNotifier = Provider.of<ToDoNotifier>(context, listen: false);

    PopupPresenter.showPopup(
      context: context,
      title: "delete_button_title".translate(context),
      message: "delete_item_confirmation".translate(context),
      primaryButtonTitle: "Cancel".translate(context),
      secondaryButtonTitle: "yes_delete".translate(context),
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
            SnackBar(content: Text('item_deleted_successfully'.translate(context))),
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

    PopupPresenter.showTextFieldDialog(
      context: context,
      isDarkMode: isDarkMode,
      title: 'edit_note_title'.translate(context),
      controller: controller,
      cancelText: 'Cancel'.translate(context),
      actionText: 'Save'.translate(context),
      onAction: () {
        context.read<NoteNotifier>().editNoteById(id, controller.text);
      },
    );
  }

  void addNote(bool isDarkMode) {
    final controller = TextEditingController();

    PopupPresenter.showTextFieldDialog(
      context: context,
      isDarkMode: isDarkMode,
      title: 'add_note_title'.translate(context),
      controller: controller,
      cancelText: 'Cancel'.translate(context),
      actionText: 'Add'.translate(context),
      onAction: () {
        context.read<NoteNotifier>().addNote(controller.text);
      },
    );
  }

  void addToDo() {
    final controller = TextEditingController();

    PopupPresenter.showTextFieldDialog(
      context: context,
      isDarkMode: context.isDarkMode,
      title: 'add_todo_title'.translate(context),
      controller: controller,
      cancelText: 'Cancel'.translate(context),
      actionText: 'Add'.translate(context),
      onAction: () {
        context.read<ToDoNotifier>().addToDo(controller.text);
      },
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
            height: 290,
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
