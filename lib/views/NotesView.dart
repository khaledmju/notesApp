import 'package:flutter/material.dart';
import 'package:notesapp/views/widgets/addNote_Bottom_Sheet.dart';
import 'package:notesapp/views/widgets/notes_view_body.dart';

import '../constans.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(16)
            ),
            context: context,
            builder: (context) {
              // better to build the method out bc when any changes u did will not appear
              //if u do not close the bottom and reopen the bottom sheet
              return AddNoteBottomSheet();
            },
          );
        },
        shape: CircleBorder(),
        backgroundColor: kPrimaryColor,
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: NotesViewBody(),
    );
  }
}
