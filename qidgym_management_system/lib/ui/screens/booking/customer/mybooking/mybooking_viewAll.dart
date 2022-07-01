import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/booking_viewmodel.dart';

import 'mybooking_viewmodel.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyBookingViewAll extends StatefulWidget {
  const MyBookingViewAll({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyBookingView createState() => _MyBookingView();
}

class _MyBookingView extends State<MyBookingViewAll> {
  @override
  Widget build(BuildContext context) {
    return View<MyBookingViewModel>(
        builder: (_, viewmodel) => StreamBuilder<List<Book>>(
              stream: viewmodel.readAllBooking(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                final _book = snapshot.data!;
                return Column(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: _book.map(buildBookList).toList(),
                    ),
                  ],
                );
              },
            ));
  }

  Widget buildBookList(Book book) => ListTile(
        leading: const CircleAvatar(
          backgroundColor: const Color.fromRGBO(238, 29, 82, 1),
        ),
        title: Text(
          book.event_name,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          book.event_name,
          style: const TextStyle(
            // fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.arrow_forward_ios_outlined,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      );
}
