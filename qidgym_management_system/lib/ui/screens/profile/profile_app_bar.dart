import "package:flutter/material.dart";
import 'package:qidgym_management_system/services/profile/current_user.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const ProfileAppBar({Key? key}) : super(key: key);

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "   Profile",
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
