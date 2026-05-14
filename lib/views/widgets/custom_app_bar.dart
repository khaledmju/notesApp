import 'package:flutter/material.dart';

import 'custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.iconData, this.onTap});

  final String title;
  final IconData iconData;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 22)),
        Spacer(),
        CustomSearchIcon(iconData: iconData, onTap: onTap,),
      ],
    );
  }
}
