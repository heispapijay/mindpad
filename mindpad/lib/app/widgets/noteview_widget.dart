import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/notes/controller/note_controller.dart';

class NoteWidgets {
  static Widget emptyNotes() {
    return Container(
      child: Center(
        child: Text(
          "You don't have any Notes",
        ),
      ),
    );
  }

  static Widget viewNotes() {
    final controller = Get.find<NoteController>();

    return Scrollbar(
      child: Container(
          // Rest of the viewNotes() code remains unchanged...
          ),
    );
  }
}
