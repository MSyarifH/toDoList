import 'package:flutter/material.dart';
import 'package:todolist/page/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolist/hive/note_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.openBox('noteBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SekolahKu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SafeArea(child: MyHomePage()),
    );
  }
}