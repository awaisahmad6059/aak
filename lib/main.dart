import 'package:aak/projects.dart';
import 'package:flutter/material.dart';

import 'SplashScreen.dart';
import 'about.dart';
import 'contact.dart';
import 'home.dart';



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Soho",
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xff252525),
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      routes: {
        'home': (context) => MyHome(),
        'about': (context) => MyAbout(),
        'projects': (context) => MyProjects(),
        'contact': (context) => MyContact(),


      },
    );
  }
}

void main() {
  runApp(const MyApp());
}
