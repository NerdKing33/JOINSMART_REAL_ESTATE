import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:housing_information_website/impVariable.dart';
import 'package:housing_information_website/pages/aboutPage.dart';
import 'package:housing_information_website/pages/accountPage.dart';
import 'package:housing_information_website/pages/homePage.dart';
import 'package:housing_information_website/pages/logInPage.dart';
import 'package:housing_information_website/pages/multiUploadPage.dart';
import 'package:housing_information_website/pages/navigationPage.dart';
import 'package:housing_information_website/pages/propertiesPage.dart';
import 'package:housing_information_website/pages/servicesPage.dart';
import 'package:housing_information_website/pages/signUpPage.dart';
import 'package:housing_information_website/themes/theme.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/accountPage' : (context) => const accountPage(),
        '/navigationPage' : (context) => const navigationPage(),
        '/signUpPage' : (context) => const signUpPage(),
        '/multiUploadPage' : (context) => const multiUploadPage(),
        '/servicesPage' : (context) => const servicesPage(),
        '/aboutPage' : (context) =>  const aboutPage(),
        '/logInPage' : (context) =>  const logInPage(),
      },
      theme: lightMode,
      darkTheme: darkMode,
      debugShowCheckedModeBanner: false,
      home:  const navigationPage(),
    );
  }
}
