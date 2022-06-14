import "package:flutter/material.dart";
import 'package:qidgym_management_system/services/profile/current_user.dart';

class HomeModeratorAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const HomeModeratorAppBar({Key? key}) : super(key: key);

  @override
  State<HomeModeratorAppBar> createState() => _HomeModeratorAppBar();

  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _HomeModeratorAppBar extends State<HomeModeratorAppBar> {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "   Home Moderator",
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
