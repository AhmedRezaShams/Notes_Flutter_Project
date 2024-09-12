import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:notes/models/note_model.dart';

class NoteController extends GetxController {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  RxList<NoteModel> notes = RxList<NoteModel>();

  @override
  void onInit() {
    super.onInit();
    fetchNotes();
  }

  void fetchNotes() {
    _firestore.collection('notes').snapshots().listen((event) {
      notes.value = event.docs.map((doc) => NoteModel.fromJson(doc.data())).toList();
    });
  }

  Future<void> addNote(String title, String content) async {
    await _firestore.collection('notes').add({
      'title': title,
      'content': content,
    });
  }

  Future<void> updateNote(String id, String title, String content) async {
    await _firestore.collection('notes').doc(id).update({
      'title': title,
      'content': content,
    });
  }

  Future<void> deleteNote(String id) async {
    await _firestore.collection('notes').doc(id).delete();
  }
}
