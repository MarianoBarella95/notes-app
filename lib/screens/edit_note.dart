import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/main.dart';


class EditNote extends StatefulWidget {
  Note? noteToEdit;
  EditNote({super.key, required this.noteToEdit});


  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
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
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                TextField(
                  controller: contentController,
                  decoration: InputDecoration(
                    hint: Text("Content"),
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 20,),
                OutlinedButton(onPressed: () {
                  noteProvider.updateNote(widget.noteToEdit!.id,titleController.text, contentController.text);
                  Navigator.pop(context);
                }, child: Text("Update"))
              ],
                        ),
            );
        } 
      ),
      ),
    );
  }
}