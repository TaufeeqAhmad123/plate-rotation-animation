import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plate_rotation_animation/Home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'plate_rotation_animation',
      theme: ThemeData(
    
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff45C37B),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
         useMaterial3: true,
      ),
       
      home:  HomeScreen(),
    );
  }
}

