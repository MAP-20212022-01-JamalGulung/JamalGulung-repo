import "package:flutter/material.dart";

class HomeCustomerAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeCustomerAppBar({Key? key}) : super(key: key);

  @override
  State<HomeCustomerAppBar> createState() => _HomeCustomerAppBarState();

  //KIV
  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _HomeCustomerAppBarState extends State<HomeCustomerAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: const Text(
        "Home",
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
