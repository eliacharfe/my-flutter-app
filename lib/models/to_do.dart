import '../packages/default_packages.dart';

class ToDo {
  String title;
  bool isCompleted;

  ToDo({required this.title, this.isCompleted = false});
}

class ToDoNotifier extends ChangeNotifier {
  final List<ToDo> _todos = [
    ToDo(title: 'Complete Flutter tutorial'),
    ToDo(title: 'Submit project report'),
    ToDo(title: 'Buy groceries'),
    ToDo(title: 'Go for a run'),
    ToDo(title: 'Read a book'),
    ToDo(title: 'Reply to emails'),
    ToDo(title: 'Plan weekend trip'),
    ToDo(title: 'Prepare for meeting'),
    ToDo(title: 'Clean the house'),
    ToDo(title: 'Call a friend'),
  ];

  List<ToDo> get todos => _todos;

  void addToDo(String title) {
    _todos.add(ToDo(title: title));
    notifyListeners();
  }

  void removeToDo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void markToDoAsComplete(int index) {
    _todos[index].isCompleted = true;
    notifyListeners();
  }
}
