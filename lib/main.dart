import 'package:chen_chou_project/view/home.dart';
import 'package:chen_chou_project/view/home_page.dart';
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
