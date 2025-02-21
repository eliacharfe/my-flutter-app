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
              toDoNotifier.addToDo(controller.text);
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
    final toDoNotifier = Provider.of<ToDoNotifier>(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldColor,
      appBar: WidgetStyling.buildTopAppBar(title: "All To-Dos", showLogoIcon: false),
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
                            color: todo.isCompleted ? Colors.green.shade700 : Colors.grey,
                          ),
                          onPressed: () => toggleMarkToDoAsComplete(index),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: AppColors.red),
                          onPressed: () => showBottomSheetModalTodo(index),
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
                backgroundColor: AppColors.lightTeal,
                foregroundColor: Colors.black,
              ),
              child: const Text('Add New To-Do'),
            ).withPadding(const EdgeInsets.symmetric(vertical: 8)),
          ],
        ).withPadding(const EdgeInsets.symmetric(horizontal: 20, vertical: 30)),
      ).withAnimation(),
    );
  }
}
