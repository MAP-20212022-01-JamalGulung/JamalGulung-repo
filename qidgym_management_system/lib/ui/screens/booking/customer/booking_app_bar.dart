import 'package:flutter/material.dart';
import 'package:qidgym_management_system/services/profile/current_user.dart';

class BookingAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BookingAppBar({Key? key}) : super(key: key);

  @override
  State<BookingAppBar> createState() => _BookingAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _BookingAppBarState extends State<BookingAppBar> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "My Book",
        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
      ),
      shape: const Border(
          bottom: BorderSide(
        color: Colors.grey,
        width: 1,
        style: BorderStyle.solid,
      )),
    );
  }
}
