import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesapp/cubits/addcotescubit/add_note_cubit.dart';

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
  List<Color> dataColor = const [
    Color(0xffFFCD7B),
    Color(0xffE8E897),
    Color(0xff77D6EF),
    Color(0xffD49DDD),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35 * 2,
      child: ListView.builder(
        itemCount: dataColor.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color =
                      dataColor[index];
                });

                // setState(() {});
              },
              child: ColorItem(
                color: dataColor[index],
                isSelected: selectedIndex == index,
              ),
            ),
          );
        },
      ),
    );
  }
}
