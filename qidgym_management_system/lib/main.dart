import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/welcome.dart';

void main() {
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
