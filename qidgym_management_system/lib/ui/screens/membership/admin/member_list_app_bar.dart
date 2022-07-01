import 'package:flutter/material.dart';

class MemberListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MemberListAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    // final AuthService _auth = AuthService();
    return AppBar(
      backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      elevation: 0,
      title: const Text(
        "Membership",
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
