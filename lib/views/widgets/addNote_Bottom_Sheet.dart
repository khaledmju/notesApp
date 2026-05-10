import 'package:flutter/material.dart';
import 'package:notesapp/views/widgets/custom_textfiled.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(children: [SizedBox(height: 32), CustomTextFiled()]),
    );
  }
}
