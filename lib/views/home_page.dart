import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/controllers/auth_controller.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/controllers/notes_controller.dart';
import 'package:notes/routes.dart';
import 'package:notes/widgets/button.dart';

class HomePage extends StatelessWidget {
  final NoteController noteController = Get.put(NoteController());
  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        actions: [
          Padding(
            padding: EdgeInsets.all(5.0),
            child: CustomButton(text: 'Logout', onPressed: (){
             authController.logout(context);

            }),
          )
        ],
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: noteController.notes.length,
          itemBuilder: (context, index) {
            NoteModel note = noteController.notes[index];
            return ListTile(
              title: Text(note.title),
              subtitle: Text(note.content),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => noteController.deleteNote(note.id),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to AddNoteScreen
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
