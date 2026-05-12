import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notesapp/constans.dart';
import 'package:notesapp/models/note_model.dart';

part 'notes_state.dart';

// this way we use it when we have a connect to server and we need time to load data
// so we use first emit(NotesLoading());
// then try and catch and also try and catch will make the peformance bad
// but here the code of these two line

//       var notesBox = Hive.box<NoteModel>(kNotesBox);
//
//       List<NoteModel> notes = notesBox.values.toList();

// its not a future so we dont need a loading state
// and we dont need a NotesFailure also bc we dont have an error
// and will not have any error

//finally the code under we use it when we have connect to server and call api

// class NotesCubit extends Cubit<NotesState> {
//   NotesCubit() : super(NotesInitial());
//
//   void fetchNotes() {
//     emit(NotesLoading());
//
//     try {
//       var notesBox = Hive.box<NoteModel>(kNotesBox);
//
//       List<NoteModel> notes = notesBox.values.toList();
//
//       emit(NotesSuccess(notes));
//
//       // we can ues for fast its same as previous code
//       // emit(NotesSuccess( notesBox.values.toList()));
//
//     } catch (e) {
//       emit(NotesFailure("$e"));
//     }
//   }
// }

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NoteModel>? notes;

  void fetchNotes() {
    var notesBox = Hive.box<NoteModel>(kNotesBox);

    notes = notesBox.values.toList();
  }
}
