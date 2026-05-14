import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notesviewcubit/notes_cubit.dart';
import 'package:notesapp/cubits/notesviewcubit/notes_cubit.dart';
import 'package:notesapp/models/note_model.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  // final dataColor = const [
  //   Color(0xffFFCD7B),
  //   Color(0xffE8E897),
  //   Color(0xff77D6EF),
  //   Color(0xffD49DDD),
  // ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context, state) {
        //..............first way
        // if (state is NotesLoading) {
        //   return CircularProgressIndicator();
        // }
        // if(state is NotesSuccess){
        //   // return the padding and the list that is inside
        //    // but here we dont have any other state instade of
        //   // success bc we dont have connect to server
        //   //
        // }
        //................................

        // this is................ the second........... way bc we dont have any state
        List<NoteModel> notes =
            BlocProvider.of<NotesCubit>(context).notes ?? [];

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
            padding: EdgeInsets.zero,

            // ...........first way
            // this is the first option but this is when we have data came from server
            // and we need the state of loading
            //  itemCount: state is NotesSuccess ? state.notes.length : 0,
            // ..................
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: NoteItem(
                  noteModel: notes[index],
                  // this was when the color was static not a picker
                  // dataColor: dataColor,
                  // index: index % dataColor.length,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
