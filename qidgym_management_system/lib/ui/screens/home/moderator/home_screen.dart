import "package:flutter/material.dart";
import 'home.dart';

class HomeModerator extends StatefulWidget {
  const HomeModerator({Key? key}) : super(key: key);

  @override
  State<HomeModerator> createState() => _HomeModerator();
}

class _HomeModerator extends State<HomeModerator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(24, 24, 24, 1),
          appBar: HomeModeratorAppBar(),
          body: HomeModeratorBody()),
    );
  }
}
