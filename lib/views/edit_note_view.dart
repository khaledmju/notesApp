import 'package:flutter/material.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/widgets/color_list_view.dart';
import 'package:notesapp/views/widgets/edit_view_body.dart';

import '../constans.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: EditNoteViewBody(noteModel: noteModel));
  }
}


