import 'package:flutter/material.dart';
import 'package:qidgym_management_system/services/profile/current_user.dart';

class EditScheduleAppBar extends StatefulWidget implements PreferredSizeWidget {
  const EditScheduleAppBar({Key? key}) : super(key: key);

  @override
  State<EditScheduleAppBar> createState() => _EditScheduleAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _EditScheduleAppBarState extends State<EditScheduleAppBar> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Color.fromRGBO(238, 29, 82, 1),
      title: Text("Update Schedule"),
    );
  }
}
