import "package:flutter/material.dart";

class PromoListAppBar extends StatefulWidget implements PreferredSizeWidget {
  const PromoListAppBar({Key? key}) : super(key: key);

  @override
  State<PromoListAppBar> createState() => PromoListAppBarState();

  //KIV
  @override
  Size get preferredSize => Size.fromHeight(50);
}

class PromoListAppBarState extends State<PromoListAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Color.fromRGBO(238, 29, 82, 1),
      title: Text("Promotion List"),
    );
  }
}
