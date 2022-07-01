import "package:flutter/material.dart";

class ViewPromotionAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  const ViewPromotionAppBar({Key? key}) : super(key: key);

  @override
  State<ViewPromotionAppBar> createState() => _ViewPromotionAppBarState();

  //KIV
  @override
  Size get preferredSize => Size.fromHeight(50);
}

class _ViewPromotionAppBarState extends State<ViewPromotionAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      backgroundColor: Color.fromRGBO(238, 29, 82, 1),
      title: Text("Promotion Details"),
    );
  }
}
