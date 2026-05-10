import 'package:flutter/material.dart';
import 'package:notesapp/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(),
        backgroundColor: Color(0xff54ECD7),
        child: Icon(Icons.add, color: Colors.black),
      ),
      body: NotesViewBody(),
    );
  }
}
