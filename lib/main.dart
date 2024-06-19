import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/pages/aboutPage.dart';
import 'package:housing_information_website/pages/accountPage.dart';
import 'package:housing_information_website/pages/homePage.dart';
import 'package:housing_information_website/pages/logInPage.dart';
import 'package:housing_information_website/pages/navigationPage.dart';
import 'package:housing_information_website/pages/propertiesPage.dart';
import 'package:housing_information_website/pages/servicesPage.dart';
import 'package:housing_information_website/pages/signUpPage.dart';
import 'package:housing_information_website/pages/uploadPage.dart';
import 'package:housing_information_website/themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyD-8y-5awQXBxqxcevTRq5MIaF4rjYG_aw",
          appId: "1:999658565706:web:003e212c086dc62da9b6b3",
          messagingSenderId: "999658565706",
          projectId: "joinsmart-estates",
        storageBucket: "joinsmart-estates.appspot.com",
      )
    );
  }else{}
  runApp(
      const MyApp()
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleCptl,
      routes: {
        '/homePage' : (context) => const homePage(),
        '/propertiesPage' : (context) => const propertiesPage(),
        '/accountPage' : (context) => accountPage(),
        '/navigationPage' : (context) => navigationPage(),
        '/signUpPage' : (context) => signUpPage(),
        '/uploadPage' : (context) => uploadPage(),
        '/servicesPage' : (context) => const servicesPage(),
        '/aboutPage' : (context) =>  aboutPage(),
        '/logInPage' : (context) =>  logInPage(),
      },
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home:  navigationPage(),
    );
  }
}
