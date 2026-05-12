import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notesapp/constans.dart';
import 'package:notesapp/cubits/add_note_cubit.dart';
import 'package:notesapp/models/note_model.dart';
import 'package:notesapp/simple_bloc_observer.dart';
import 'package:notesapp/views/NotesView.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();

  // this is will tell the hive that ill start  saving  data
  Hive.registerAdapter(NoteModelAdapter());


  // we should add <NoteModel> to tell the type of data and what we will save
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

// class NotesApp extends StatelessWidget {
//   const NotesApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [BlocProvider(create: (context) => AddNoteCubit())],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         // theme: ThemeData(
//         //     // brightness: Brightness.dark // this is for background color or we use this
//         //   // scaffoldBackgroundColor: Color(0xff2E2D2F),
//         //
//         //
//         // ),
//
//         // or this
//         theme: ThemeData.dark().copyWith(
//           scaffoldBackgroundColor: Color(0xff2E2D2F),
//         ),
//         home: NotesView(),
//       ),
//     );
//   }
// }




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
