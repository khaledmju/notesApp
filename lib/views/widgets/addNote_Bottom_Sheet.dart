import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notesapp/cubits/addcotescubit/add_note_cubit.dart';
import '../../cubits/notesviewcubit/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(
          left: 24,
          right: 24,

          // this is when i press on text filed will change the tall of bottom sheet
          // and will take the height
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),

        // we could use Bloc listener instade of BlocConsumer because we dont have a rebuild
        // but we use AbsorbPointer so we need to use BlocConsumer
        // we use listener if we dont want to rebuild a ui just to do some line of code
        // like moving back or navigate to page and like this
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              print("failed ${state.errMassage}");
            }

            if (state is AddNoteSuccess) {
              BlocProvider.of<NotesCubit>(context).fetchNotes();

              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: SingleChildScrollView(child: AddNoteForm()),
            );
          },
        ),
      ),
    );
  }
}
