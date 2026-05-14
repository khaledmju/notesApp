import 'package:bloc/bloc.dart';
import 'package:flutter/animation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/constans.dart';
import 'package:notesapp/models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  //we can use this but we need on color List view to add this
  /*@override
void initState() {
  super.initState();
  // ✅ مزامنة الـ UI مع الـ Cubit من أول لحظة
  BlocProvider.of<AddNoteCubit>(context).color = dataColor[0];
}*/

  // to use this way we need to do what is written above
  // Color? color ;

  // or this and set the default value the first element in color list
  Color color = Color(0xffFFCD7B);

  Future<void> addNote(NoteModel note) async {
    note.color = color.value;
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      emit(AddNoteSuccess());
      await notesBox.add(note);
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
