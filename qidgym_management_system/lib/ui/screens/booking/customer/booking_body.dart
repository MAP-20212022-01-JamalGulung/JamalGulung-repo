import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/model/bookingDetails.dart';
import 'package:qidgym_management_system/model/roomDetails.dart';
import 'package:qidgym_management_system/services/world_time.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/booking_viewmodel.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/bookingform/bookingform_screen.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/mybooking/mybooking_body.dart';

class BookingBody extends StatefulWidget {
  const BookingBody({Key? key}) : super(key: key);

  @override
  State<BookingBody> createState() => _BookingBodyState();
}

class _BookingBodyState extends State<BookingBody> {
  Book book = Book();
  bool one = false;
  bool two = false;
  bool three = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: View<BookingViewModel>(
          builder: (_, viewmodel) => StreamBuilder<List<Room>>(
                stream: viewmodel.readRoom(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                  final _room = snapshot.data!;
                  return StreamBuilder<List<Book>>(
                    stream: viewmodel.readBooking(),
                    builder: (context, snapshot2) {
                      if (snapshot2.hasError) {
                        return Text('Something went wrong');
                      }
                      if (snapshot2.connectionState ==
                          ConnectionState.waiting) {
                        return Text("Loading");
                      }
                      final _book = snapshot2.data!;
                      return Column(
                        children: [
                          ListView(
                            shrinkWrap: true,
                            children: _room.map(buildRoomList).toList(),
                          ),
                          ListView(
                            shrinkWrap: true,
                            children: _book.map(buildSlotList).toList(),
                          ),
                          SizedBox(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, top: 8.0),
                                  child: Column(
                                    children: [
                                      Text('Date: $tomorrowDate',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 17,
                                              color: Colors.white)),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      ElevatedButton(
                                        style: one
                                            ? ElevatedButton.styleFrom(
                                                primary: Color.fromARGB(
                                                    255, 128, 150, 150))
                                            : ElevatedButton.styleFrom(
                                                primary: Colors.teal.shade900),
                                        onPressed: () {
                                          one
                                              ? null
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookingForm(
                                                              slot: '1')),
                                                );
                                        },
                                        child: Text('05.00 pm - 07.00 pm'),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                        style: two
                                            ? ElevatedButton.styleFrom(
                                                primary: Color.fromARGB(
                                                    255, 128, 150, 150))
                                            : ElevatedButton.styleFrom(
                                                primary: Colors.teal.shade900),
                                        onPressed: () {
                                          two
                                              ? null
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookingForm(
                                                              slot: '2')),
                                                );
                                        },
                                        child: Text('05.00 pm - 07.00 pm'),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      ElevatedButton(
                                        style: three
                                            ? ElevatedButton.styleFrom(
                                                primary: Color.fromARGB(
                                                    255, 128, 150, 150))
                                            : ElevatedButton.styleFrom(
                                                primary: Colors.teal.shade900),
                                        onPressed: () {
                                          three
                                              ? null
                                              : Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          BookingForm(
                                                              slot: '3')),
                                                );
                                        },
                                        child: Text('05.00 pm - 07.00 pm'),
                                      ),
                                    ],
                                  )))
                        ],
                      );
                    },
                  );
                },
              )),
    );
  }

  Widget buildRoomList(Room room) => SizedBox(
      child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Column(
            children: [
              Image.network(
                room.Image,
                fit: BoxFit.fill,
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Text('Price:' + room.Price + '/slot',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 23,
                            color: Colors.white)),
                  ),
                  Expanded(
                      flex: 3,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MyBookingBody()),
                            );
                          },
                          child: Text(
                            'My Booking',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromRGBO(238, 29, 82, 1)),
                          )))
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 23,
                      color: Colors.white),
                ),
              ),
              Text(
                room.Desc,
                style: TextStyle(fontSize: 15, color: Colors.white60),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          )));

  Widget buildSlotList(Book book) {
    if (book.slot == '1') {
      one = true;
    }
    if (book.slot == '2') {
      two = true;
    }
    if (book.slot == '3') {
      three = true;
    }
    return SizedBox();
  }
}
