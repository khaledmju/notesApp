import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/addcotescubit/add_note_cubit.dart';

import '../../constans.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});

  final bool isSelected;

  final Color color;

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
            radius: 35,
            backgroundColor: Colors.white,
            child: CircleAvatar(radius: 33, backgroundColor: color),
          )
        : CircleAvatar(radius: 33, backgroundColor: color);
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  // this is if we want to use on AddNoteCubit the way Color? color ;

  // @override
  // void initState() {
  //   super.initState();
  //   // ✅ مزامنة الـ UI مع الـ Cubit من أول لحظة
  //   BlocProvider.of<AddNoteCubit>(context).color = dataColor[0];
  // }

  int selectedIndex = 0;


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
                  BlocProvider.of<AddNoteCubit>(context).color =
                  kColorList[index];
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
