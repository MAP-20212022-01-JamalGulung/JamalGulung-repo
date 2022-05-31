import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/welcome.dart';

import 'app/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      title: 'QidGym App',
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        backgroundColor: Color.fromRGBO(238, 29, 82, 1),
        splash: Image.asset('assets/loading.png'),
        duration: 1000,
        splashTransition: SplashTransition.rotationTransition,
        nextScreen: HomePage(),
      )));
}
