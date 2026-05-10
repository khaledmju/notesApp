import 'package:flutter/material.dart';

import 'note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  final dataColor = const [
    Color(0xffFFCD7B),
    Color(0xffE8E897),
    Color(0xff77D6EF),
    Color(0xffD49DDD),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: NoteItem(
              dataColor: dataColor,
              index: index % dataColor.length,
            ),
          );
        },
      ),
    );
  }
}
