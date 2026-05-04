import 'package:flutter/material.dart';
import 'package:provider_test/main.dart';
import 'package:provider_test/screens/add_note.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/screens/edit_note.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Notes App"), backgroundColor: Colors.lightBlueAccent,),
        body: Center(
          child: Consumer<NoteProvider>(
            builder: (context, noteProvider, child) {
              if (noteProvider.notes.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(image: AssetImage("assets/icons8-empty-100.png")),
                    SizedBox(height: 30,),
                    Title(color: Colors.lightBlue, child: Text("¡ADD A NOTE!", style: TextStyle(fontWeight: FontWeight(800))),)
                  ],
                );
              } else {
                return ListView.separated(
                  separatorBuilder: (BuildContext context, int index) => const Divider(),
                  itemCount: noteProvider.notes.length,
                  itemBuilder: (context, index) {
                    final nota = noteProvider.notes[index];
                    return ListTile(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => EditNote(noteToEdit: nota)));
                      },
                      leading: Image(image: AssetImage("assets/icons8-note-48.png")),
                      title: Text(noteProvider.notes[index].title.toString()),
                      subtitle: Text(
                        noteProvider.notes[index].content.toString(),
                      ),
                      trailing: IconButton(onPressed: () {
                        noteProvider.deleteNote(nota.id);
                      }, icon: Icon(Icons.delete), color: Colors.redAccent),
                      //tileColor: Colors.grey,
                    );
                  },
                );
              }
            },
          ),
        ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddNote()));
      }, child: Icon(Icons.add)),
      );
  }
}