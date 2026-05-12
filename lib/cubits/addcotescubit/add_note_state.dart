part of 'add_note_cubit.dart';

@immutable
sealed class AddNoteState {}

final class AddNoteInitial extends AddNoteState {}


// we have time to do the operation so we need loading
// in general any thing need time and future operation will need loading
final class AddNoteLoading extends AddNoteState {}


// then we either success or failure so we need these to state
final class AddNoteSuccess extends AddNoteState {}

final class AddNoteFailure extends AddNoteState {
  final String errMassage;

  AddNoteFailure(this.errMassage);
}
