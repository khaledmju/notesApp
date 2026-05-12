import 'package:flutter/material.dart';

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
          SizedBox(height: 32),

          CustomButton(
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
