// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:notes/controllers/auth_controller.dart';
// import 'package:notes/models/note_model.dart';
// import 'package:notes/controllers/notes_controller.dart';
// import 'package:notes/routes.dart';
// import 'package:notes/widgets/button.dart';
//
// class HomePage extends StatelessWidget {
//   final NoteController noteController = Get.put(NoteController());
//   final AuthController authController = Get.put(AuthController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Notes"),
//         actions: [
//           Padding(
//             padding: EdgeInsets.all(5.0),
//             child: CustomButton(text: 'Logout', onPressed: (){
//              authController.logout(context);
//
//             }),
//           )
//         ],
//       ),
//       body: Obx(() {
//         return ListView.builder(
//           itemCount: noteController.notes.length,
//           itemBuilder: (context, index) {
//             NoteModel note = noteController.notes[index];
//             return ListTile(
//               title: Text(note.title),
//               subtitle: Text(note.content),
//               trailing: IconButton(
//                 icon: Icon(Icons.delete),
//                 onPressed: () => noteController.deleteNote(note.id),
//               ),
//             );
//           },
//         );
//       }),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Navigate to AddNoteScreen
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes/controllers/notes_controller.dart';

import '../controllers/auth_controller.dart';
import '../widgets/button.dart';

class HomePage extends StatelessWidget {
  final NotesController notesController = Get.put(NotesController());
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Notes',
        style: TextStyle(
          color: Colors.indigo
        ),
        ),
        actions: [
        Padding(
            padding: EdgeInsets.all(5.0),
            child: CustomButton(text: 'Logout', onPressed: (){
             authController.logout(context);

            }
            ),
        )
        ],
        automaticallyImplyLeading: false,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: notesController.getNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final notes = snapshot.data?.docs ?? [];

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              var note = notes[index];
              return Padding(
                padding: const EdgeInsets.only(
                  left: 5,
                  right: 5,
                  top: 5
                ),
                child: ListTile(
                  title: Text(note['title']),
                  subtitle: Text(note['content']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit,
                        color: Colors.indigoAccent,),
                        onPressed: () {
                          _showNoteDialog(context, note);  // Show dialog to edit note
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete,
                        color: Colors.red,),
                        onPressed: () {
                          notesController.deleteNote(note.id);  // Delete note
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNoteDialog(context, null);
        },
        child: Icon(Icons.add,
        color: Colors.white,),  // Icon inside the button
        tooltip: 'Add something',
        backgroundColor: Colors.indigo,  // Button color
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,  // Position of FAB
    );
  }

  // Function to show dialog for adding/updating a note
  void _showNoteDialog(BuildContext context, QueryDocumentSnapshot? note) {
    final TextEditingController titleController = TextEditingController(
      text: note != null ? note['title'] : '',
    );
    final TextEditingController contentController = TextEditingController(
      text: note != null ? note['content'] : '',
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(note == null ? 'Add Note' : 'Edit Note'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: contentController,
                decoration: InputDecoration(labelText: 'Content'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (note == null) {
                  // Create a new note
                  notesController.addNote(
                    titleController.text.trim(),
                    contentController.text.trim(),
                  );
                } else {
                  // Update existing note
                  notesController.updateNote(
                    note.id,
                    titleController.text.trim(),
                    contentController.text.trim(),
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text(note == null ? 'Add' : 'Update'),
            ),
          ],
        );
      },
    );
  }
}
