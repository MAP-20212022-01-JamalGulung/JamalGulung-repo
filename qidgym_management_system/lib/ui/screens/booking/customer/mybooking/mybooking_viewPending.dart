import 'package:flutter/material.dart';
import 'package:map_mvvm/view.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
// import 'package:qidgym_management_system/ui/screens/booking/customer/booking_viewmodel.dart';

import 'mybooking_viewmodel.dart';
// import 'package:google_fonts/google_fonts.dart';

class MyBookingViewPending extends StatefulWidget {
  const MyBookingViewPending({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyBookingViewPending createState() => _MyBookingViewPending();
}

class _MyBookingViewPending extends State<MyBookingViewPending> {
  @override
  Widget build(BuildContext context) {
    return View<MyBookingViewModel>(
        builder: (_, viewmodel) => StreamBuilder<List<Book>>(
              stream: viewmodel.readPendingBooking(),
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
          icon: Icon(Icons.cancel_outlined, color: Colors.white),
          onPressed: () {}

          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) =>

          //   },
          // ),
          ));

  //  return ListView(
  //     children: ListTile.divideTiles(
  //       context: context,
  //       tiles: [
  //         ListView(
  //           shrinkWrap: true,
  //           children: _book.map(buildSlotList).toList(),
  //         ),
  //       ],
  //     ).toList(),
  //   );

//   showAlertDialog(BuildContext context) {
//     // set up the buttons
//     Widget cancelButton = TextButton(
//       child: Text("Cancel"),
//       onPressed: () {},
//     );
//     Widget continueButton = TextButton(
//       child: Text("Confirm"),
//       onPressed: () {},
//     );

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       title: Text("Renew Membership"),
//       content:
//           Text("Would you like to renew your membership for another 3 months?"),
//       actions: [
//         cancelButton,
//         continueButton,
//       ],
//     );

//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
}
