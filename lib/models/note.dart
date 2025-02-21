import '../packages/default_packages.dart';
import 'package:uuid/uuid.dart';

class Note {
  final String id;
  String text;

  Note({
    required this.id,
    required this.text,
  });
}

class NoteNotifier extends ChangeNotifier {
  final uuid = Uuid();
  List<Note> notes = [
    Note(id: "1", text: 'Note 1'),
    Note(id: "2", text: 'Note 2'),
  ];

  void addNote(String note) {
    notes.add(Note(id: uuid.v4(), text: note));
    notifyListeners();
  }

  void removeNoteById(String id) {
    notes.removeWhere((note) => note.id == id);
    notifyListeners();
  }

  void editNoteById(String id, String newText) {
    final note = notes.firstWhere((note) => note.id == id);
    note.text = newText;
    notifyListeners();
  }
}
