import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mindpad/app/pages/notes/controller/note_controller.dart';
import 'package:mindpad/app/pages/notes/views/detailnote/detailnote.dart';
import 'package:mindpad/app/themes/themes.dart';
import 'package:mindpad/app/widgets/notification.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeView extends StatelessWidget {
  final controller = Get.put(NoteController());

  // ignore: prefer_typing_uninitialized_variables
  var staggeredGridView;

  Widget emptyNotes() {
    return Container(
      child: Center(
        child: Text(
          "You don't have any Notes",
        ),
      ),
    );
  }

  Widget viewNotes() {
    return Scrollbar(
      child: Container(
        padding: EdgeInsets.only(
          top: 10,
          right: 10,
          left: 10,
        ),
        child: staggeredGridView.countBuilder(
          itemCount: controller.notes.length,
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          //staggeredTileBuilder: (index) => StaggeredTile.fit(1),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  NoteDetailPage(),
                  arguments: index,
                );
              },
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return NotificationWidget(
                      contentText: "Are you sure you want to delete the note?",
                      confirmFunction: () {
                        controller.deleteNote(controller.notes[index].id);
                        Get.back();
                      },
                      declineFunction: () {
                        Get.back();
                      },
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.all(15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.notes[index].title,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.notes[index].content,
                      style: TextStyle(
                        fontSize: 17,
                      ),
                      maxLines: 6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      controller.notes[index].dateTimeEdited,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "MindPad",
          style: AppFonts.boldFontBlack(24),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              //showSearch(context: context, delegate: SearchBar());
            },
          ),
          PopupMenuButton(
            onSelected: (val) {
              if (val == 0) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return NotificationWidget(
                      contentText: "Are you sure you want to delete all notes?",
                      confirmFunction: () {
                        controller.deleteAllNotes();
                        Get.back();
                      },
                      declineFunction: () {
                        Get.back();
                      },
                    );
                  },
                );
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Text(
                  "Delete All Notes",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: GetBuilder<NoteController>(
        builder: (_) => controller.isEmpty() ? emptyNotes() : viewNotes(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Get.to(AddNewNotePage());
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
