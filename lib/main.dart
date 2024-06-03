import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_management_getx/screen_splash.dart';
import 'package:student_management_getx/screens/adding/add_student.dart';
import 'package:student_management_getx/screens/home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.crimsonPro().fontFamily,
       textTheme: const TextTheme(
        titleSmall: TextStyle(color: Colors.white),
        bodyLarge: TextStyle(color: Colors.white),
        bodyMedium: TextStyle(color: Colors.white),
        bodySmall: TextStyle(color: Colors.white),
       ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
       initialRoute: '/SplashScreen',
      getPages: [
        GetPage(name: '/Home', page: () => Home()),
        GetPage(name: '/AddStudent', page: () => AddStudent()),
        GetPage(name: '/SplashScreen', page: ()=>SplashScreen()),
      ],
    );
  }
}

