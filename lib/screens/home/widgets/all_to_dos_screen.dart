import 'package:eliachar_feig/models/to_do.dart';
import '../../../packages/default_packages.dart';
import '../../../packages/ui_components_packages.dart';
import '../../../packages/utlis_packages.dart';

class AllToDosScreen extends StatefulWidget {
  const AllToDosScreen({super.key});

  @override
  State<AllToDosScreen> createState() => _AllToDosScreenState();
}

class _AllToDosScreenState extends State<AllToDosScreen> with SingleTickerProviderStateMixin {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = context.isDarkMode;
    final toDoNotifier = Provider.of<ToDoNotifier>(context);

    return Scaffold(
      backgroundColor: context.scaffoldColor,
      appBar: WidgetStyling.buildTopAppBar(title: "all_tasks_title".translate(context), showLogoIcon: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: toDoNotifier.todos.length,
                itemBuilder: (context, index) {
                  final todo = toDoNotifier.todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(
                            todo.isCompleted ? Icons.check_circle : Icons.check_circle_outline,
                            color: todo.isCompleted ? (isDarkMode ? Colors.white : Colors.green.shade700) : Colors.grey,
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
                },
              ),
            ),
            ElevatedButton(
              onPressed: addToDo,
              style: ElevatedButton.styleFrom(
                backgroundColor: isDarkMode ? Colors.white : AppColors.lightTeal,
                foregroundColor: Colors.black,
              ),
              child: Text('add_new_todo'.translate(context)),
            ).withPadding(const EdgeInsets.symmetric(vertical: 10, horizontal: 10)),
          ],
        ).withPadding(const EdgeInsets.symmetric(horizontal: 20, vertical: 30)),
      ).withAnimation(),
    );
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

  void addToDo() {
    final controller = TextEditingController();
    final toDoNotifier = Provider.of<ToDoNotifier>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: context.isDarkMode ? AppColors.darkGray : Colors.white,
        title: Text('add_todo_title'.translate(context)).applySansStyle(size: 24, fontWeight: FontWeight.w500),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'.translate(context)).applySansStyle(color: AppColors.red, fontWeight: FontWeight.w600),
          ),
          TextButton(
            onPressed: () {
              toDoNotifier.addToDo(controller.text);
              Navigator.pop(context);
            },
            child: Text('Add'.translate(context)).applySansStyle(
              fontWeight: FontWeight.w600,
              color: context.isDarkMode ? Colors.white : Colors.teal,
            ),
          ),
        ],
      ),
    );
  }
}
