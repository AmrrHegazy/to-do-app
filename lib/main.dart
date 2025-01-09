import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_app/home_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('mybox'); // فتح صندوق Hive
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do App',
      theme: ThemeData(
        textTheme: GoogleFonts.acmeTextTheme(
          Theme.of(context).textTheme.apply(displayColor: Colors.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
