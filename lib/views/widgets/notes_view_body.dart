import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/notesviewcubit/notes_cubit.dart';
import 'package:notesapp/views/widgets/custom_textfiled.dart';

import 'custom_app_bar.dart';

import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isTaped = false;

  @override
  void initState() {
    // this is will fetch the notes
    BlocProvider.of<NotesCubit>(context).fetchNotes();

    BlocProvider.of<NotesCubit>(context).searchList =
        BlocProvider.of<NotesCubit>(context).notes;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          isTaped
              ? CustomTextFiled(
                  hint: "search on title",
                  onChange: (value) {
                    BlocProvider.of<NotesCubit>(
                      context,
                    ).search(value.toString());
                  },
                  isSearch: true,
                  onTapIcon: () {
                    BlocProvider.of<NotesCubit>(context).search("");
                    isTaped = false;
                    setState(() {});
                  },
                )
              : CustomAppBar(
                  title: "Notes",
                  iconData: Icons.search,
                  onTap: () {
                    isTaped = true;
                    setState(() {});
                  },
                ),
          // CustomTextFiled(hint: "hint"),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
