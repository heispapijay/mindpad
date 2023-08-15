import 'package:flutter/material.dart';
import 'package:mindpad/app/widgets/data.dart';
import 'package:mindpad/app/widgets/notes.dart';
import 'package:share/share.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:string_stats/string_stats.dart';

class NoteController extends GetxController {
  var notes = <Notes>[];

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  int contentWordCount = 0;
  int contentCharCount = 0;

  @override
  void onInit() {
    getAllNotes();
    super.onInit();
  }

  bool isEmpty() {
    return notes?.isEmpty ?? true;
  }

  void addNoteToDatabase() async {
    String title = titleController.text;
    String content = contentController.text;
    if (title == null || title.isEmpty) {
      title = "Unnamed Title";
    }
    Notes note = Notes(
      title: title,
      content: content,
      dateTimeEdited:
          DateFormat("MMM dd, yyyy  HH:mm:ss").format(DateTime.now()),
      dateTimeCreated:
          DateFormat("MMM dd, yyyy HH:mm:ss").format(DateTime.now()),
      id: -1,
    );
    await DatabaseHelper.instance.addNote(note);
    contentWordCount = wordCount(content);
    contentCharCount = charCount(content);
    titleController.text = "";
    contentController.text = "";
    getAllNotes();
    Get.back();
  }

  void deleteNote(int id) async {
    final noteToDelete = notes.firstWhere((note) => note.id == id);
    await DatabaseHelper.instance.deleteNote(noteToDelete);
    getAllNotes();
  }

  void deleteAllNotes() async {
    await DatabaseHelper.instance.deleteAllNotes();
    getAllNotes();
  }

  void updateNote(int id, String dTCreated) async {
    final title = titleController.text;
    final content = contentController.text;
    Notes note = Notes(
      id: id,
      title: title,
      content: content,
      dateTimeEdited:
          DateFormat("MMM dd, yyyy HH:mm:ss").format(DateTime.now()),
      dateTimeCreated: dTCreated,
    );
    await DatabaseHelper.instance.updateNote(note);
    contentWordCount = wordCount(content);
    contentCharCount = charCount(content);
    titleController.text = "";
    contentController.text = "";
    getAllNotes();
    Get.back();
  }

  void getAllNotes() async {
    notes = await DatabaseHelper.instance.getNoteList();
    update();
  }

  void shareNote(String title, String content, String dateTimeEdited) {
    Share.share("$title \n\n$dateTimeEdited\n\n$content");
  }
}
