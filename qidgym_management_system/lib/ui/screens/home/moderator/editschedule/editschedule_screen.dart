import 'package:flutter/material.dart';
import 'editschedule.dart';

class EditSchedule extends StatefulWidget {
  const EditSchedule({Key? key}) : super(key: key);

  @override
  State<EditSchedule> createState() => _EditScheduleState();
}

class _EditScheduleState extends State<EditSchedule> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(24, 24, 24, 1),
          appBar: EditScheduleAppBar(),
          body: EditScheduleBody()),
    );
  }
}
