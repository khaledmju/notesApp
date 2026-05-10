import 'package:flutter/material.dart';
import 'package:notesapp/views/widgets/custom_textfiled.dart';

import 'custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50),
          CustomAppBar(title: "Edit Note", iconData: Icons.check),
          SizedBox(height: 50),
          CustomTextFiled(hint: "hint"),
          SizedBox(height: 16),
          CustomTextFiled(hint: "content", maxLines: 5),
        ],
      ),
    );
  }
}
