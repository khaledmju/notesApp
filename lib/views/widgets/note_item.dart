import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notesviewcubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    super.key,

    // required this.dataColor,
    // required this.index,
    required this.noteModel,
  });

  // final List dataColor;
  //
  // final int index;

  final NoteModel noteModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return EditNoteView(noteModel: noteModel);
            },
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Color(0xffFFCD7B),

          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(
                // "Flutter Tips",
                noteModel.title,
                style: TextStyle(color: Colors.black, fontSize: 26),
              ),
              // trailing: IconButton(
              //   padding: null,
              //
              //   onPressed: () {},
              //   icon: Icon(Icons.delete, color: Colors.black, size: 22),
              // ),
              trailing: GestureDetector(
                onTap: () {
                  // this from hive
                  noteModel.delete();
                  BlocProvider.of<NotesCubit>(context).fetchNotes();
                },
                child: Icon(Icons.delete, color: Colors.black, size: 26),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  // "Build your career with thrawt sumy",
                  noteModel.subtitle,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 24),
              child: Text(
                // "May 21,2022",
                noteModel.date,
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
