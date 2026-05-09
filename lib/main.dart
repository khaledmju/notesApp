import 'package:flutter/material.dart';
import 'package:notesapp/views/NotesView.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     // brightness: Brightness.dark // this is for background color or we use this
      //   // scaffoldBackgroundColor: Color(0xff2E2D2F),
      //
      //
      // ),

      // or this
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xff2E2D2F),
      ),
      home: NotesView(),
    );
  }
}
