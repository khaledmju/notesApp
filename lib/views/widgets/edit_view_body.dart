import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notesviewcubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/widgets/custom_textfiled.dart';

import '../../constans.dart';
import 'color_list_view.dart';
import 'custom_app_bar.dart';
import 'edit_note_color_list.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title;

  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(
            title: "Edit Note",
            iconData: Icons.check,
            onTap: () {
              widget.noteModel.title = title ?? widget.noteModel.title;
              widget.noteModel.subtitle = subTitle ?? widget.noteModel.subtitle;

              widget.noteModel.save();

              BlocProvider.of<NotesCubit>(context).fetchNotes();

              Navigator.pop(context);
            },
          ),
          SizedBox(height: 50),
          CustomTextFiled(
            hint: widget.noteModel.title,
            onChange: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextFiled(
            hint: widget.noteModel.subtitle,
            maxLines: 5,
            onChange: (value) {
              subTitle = value;
            },
          ),

          SizedBox(height: 32),
          EditNoteColorListView(noteModel: widget.noteModel),
        ],
      ),
    );
  }
}
