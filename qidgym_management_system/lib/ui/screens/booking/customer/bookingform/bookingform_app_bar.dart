import 'package:flutter/material.dart';
import 'package:qidgym_management_system/services/profile/current_user.dart';

class BookingFormAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BookingFormAppBar({Key? key}) : super(key: key);

  @override
  State<BookingFormAppBar> createState() => _BookingFormAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _BookingFormAppBarState extends State<BookingFormAppBar> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Color.fromRGBO(238, 29, 82, 1),
      title: Text("Booking Detail"),
    );
  }
}
