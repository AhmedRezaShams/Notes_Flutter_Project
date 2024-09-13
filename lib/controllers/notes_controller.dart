import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class NotesController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // Collection reference
  CollectionReference notes = FirebaseFirestore.instance.collection('notes');

  // Method to add a new note (CREATE)
  Future<void> addNote(String title, String content) async {
    try {
      await notes.add({
        'title': title,
        'content': content,
        'createdAt': Timestamp.now(),
      });
      Get.snackbar('Success', 'Note added successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to add note');
    }
  }

  // Method to fetch all notes (READ)
  Stream<QuerySnapshot> getNotes() {
    return notes.orderBy('createdAt', descending: true).snapshots();
  }

  // Method to update a note (UPDATE)
  Future<void> updateNote(String noteId, String title, String content) async {
    try {
      await notes.doc(noteId).update({
        'title': title,
        'content': content,
      });
      Get.snackbar('Success', 'Note updated successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to update note');
    }
  }

  // Method to delete a note (DELETE)
  Future<void> deleteNote(String noteId) async {
    try {
      await notes.doc(noteId).delete();
      Get.snackbar('Success', 'Note deleted successfully');
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete note');
    }
  }
}
