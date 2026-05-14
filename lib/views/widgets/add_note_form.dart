import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notesapp/cubits/addcotescubit/add_note_cubit.dart';
import 'package:notesapp/models/note_model.dart';

import 'color_list_view.dart';
import 'custom_button.dart';
import 'custom_textfiled.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 32),
          CustomTextFiled(
            hint: "Title",
            onSaved: (value) {
              title = value;
            },
          ),
          SizedBox(height: 16),
          CustomTextFiled(
            hint: "Content",
            onSaved: (value) {
              subTitle = value;
            },
            maxLines: 5,
          ),
          SizedBox(height: 15),

          ColorListView(),
          SizedBox(height: 15),

          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var currentDate = DateTime.now();

                    // we use intl package for date format
                    // we can use this or
                    var formatedDate = DateFormat.yMd().format(currentDate);

                    // here i but my format
                    // var formatedDate = DateFormat(
                    //   "dd-mm-yyyy",
                    // ).format(currentDate);

                    var noteModel = NoteModel(
                      title: title!,
                      subtitle: subTitle!,
                      date: formatedDate,
                      color: Colors.black.value,
                    );

                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
