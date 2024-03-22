import 'package:chen_chou_project/view/home_page.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

  runApp(
    MaterialApp(
      title: 'Chen Chou Projects',
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      theme: ThemeData(),
      home: const HomePage(),
    ),
  );
}
