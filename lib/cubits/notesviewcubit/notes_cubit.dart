import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/constans.dart';
import 'package:notesapp/models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetechNotes() {
    emit(NotesLoading());

    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);

      List<NoteModel> notes = notesBox.values.toList();

      emit(NotesSuccess(notes));

      // we can ues for fast its same as previous code
      // emit(NotesSuccess( notesBox.values.toList()));

    } catch (e) {
      emit(NotesFailure("$e"));
    }
  }
}
