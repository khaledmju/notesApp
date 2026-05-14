// we make an copy from class color list view bc we dont want to make an if condition to check which page we are in
// and dont want to use bloc provider
import 'package:flutter/material.dart';

import '../../constans.dart';
import '../../models/note_model.dart';
import 'color_list_view.dart';

class EditNoteColorListView extends StatefulWidget {
  const EditNoteColorListView({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNoteColorListView> createState() => _EditNoteColorListViewState();
}

class _EditNoteColorListViewState extends State<EditNoteColorListView> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = kColorList.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        itemCount: kColorList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  widget.noteModel.color = kColorList[index].value;
                });

                // setState(() {});
              },
              child: ColorItem(
                color: kColorList[index],
                isSelected: selectedIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
