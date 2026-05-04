import 'package:flutter/material.dart';
import 'package:provider_test/main.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/screens/home.dart';

class AddNote extends StatefulWidget {
  const AddNote({super.key});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  // Controllers
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Note")),
      body: Center(
        child: Consumer<NoteProvider>(
          builder: (context, noteProvider, child) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(
                      hint: Text("Title"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: contentController,
                    decoration: InputDecoration(
                      hint: Text("Content"),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 30),
                  OutlinedButton(
                    onPressed: () {
                      noteProvider.addNote(
                        titleController.text,
                        contentController.text,
                      );
                      Navigator.pop(context);
                    },
                    child: Text("Add"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
