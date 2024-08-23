import 'package:chen_chou_project/home.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  runApp(
    MaterialApp(
      title: 'Chen Chou Projects',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffF2F0EC),
      ),
      home: const Home(),
    ),
  );
}
