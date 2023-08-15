import 'package:intl/intl.dart';

class Notes {
  int id;
  String title;
  String content;
  String dateTimeEdited;
  String dateTimeCreated;

  Notes({
    required this.id,
    required this.title,
    required this.content,
    required this.dateTimeEdited,
    required this.dateTimeCreated,
  });

  // Factory constructor without the 'id'
  factory Notes.withoutId({
    required String title,
    required String content,
    required String dateTimeEdited,
    required String dateTimeCreated,
  }) {
    return Notes(
      id: -1,
      title: title,
      content: content,
      dateTimeEdited:
          DateFormat("MMM dd, yyyy  HH:mm:ss").format(DateTime.now()),
      dateTimeCreated:
          DateFormat("MMM dd, yyyy HH:mm:ss").format(DateTime.now()),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "dateTimeEdited": dateTimeEdited,
      "dateTimeCreated": dateTimeCreated,
    };
  }
}
