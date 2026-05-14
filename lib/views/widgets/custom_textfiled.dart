import 'package:flutter/material.dart';
import 'package:notesapp/constans.dart';

class CustomTextFiled extends StatelessWidget {
  const CustomTextFiled({
    super.key,
    required this.hint,
    this.maxLines = 1,
    this.onSaved,
    this.onChange,
    this.isSearch = false,
    this.onTapIcon,
  });

  final String hint;

  final int maxLines;

  final bool isSearch;

  final void Function(String?)? onSaved;
  final void Function(String?)? onChange;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Filled is required";
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        suffixIcon: isSearch
            ? GestureDetector(
                onTap: onTapIcon,
                child: Icon(Icons.clear, color: Colors.white),
              )
            : null,
        hintText: hint,
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
        errorBorder: buildBorder(Colors.red),
      ),
    );
  }

  // [color] mean not required parameter
  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: color ?? Colors.white),
    );
  }
}
