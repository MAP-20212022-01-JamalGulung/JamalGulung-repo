import 'package:flutter/material.dart';

class BookingModeratorAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BookingModeratorAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Booking [Moderator]'),
      centerTitle: true,
      backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      foregroundColor: Colors.grey,
    );
  }
}
