import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/screens/add_note.dart';
import 'package:provider_test/screens/home.dart';

class Note {
  int id;
  String? title;
  String? content;

  Note({required this.id, this.title, required this.content});
}

class NoteProvider extends ChangeNotifier {
  final List<Note> _notes = [];
  int id = 0;

  List<Note> get notes => _notes;

  void addNote(String title, String content)
  {
    Note n = Note(id: id++, title: title, content: content);
    notes.add(n);
    notifyListeners();
  }

  void updateNote(int id, String title, String content)
  { 
    var index = notes.indexWhere((x) => x.id == id);

    notes[index] = Note(id: id,title: title, content: content);    
    notifyListeners();
  }

  void deleteNote(int id)
  {
    notes.removeWhere((c) => c.id == id);
    notifyListeners();
  }

}

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => NoteProvider())],
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home()
      );
  }
}
