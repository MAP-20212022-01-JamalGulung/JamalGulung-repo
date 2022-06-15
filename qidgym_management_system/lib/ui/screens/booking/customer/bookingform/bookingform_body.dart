import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/services/world_time.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/bookingform/bookingform_viewmodel.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/booking_screen.dart';

class BookingFormBody extends StatefulWidget {
  final String slot;
  const BookingFormBody({Key? key, required this.slot}) : super(key: key);

  @override
  State<BookingFormBody> createState() =>
      _BookingFormBodyState(slot: this.slot);
}

class _BookingFormBodyState extends State<BookingFormBody> {
  String slot;
  String duration = '';
  final _eventNameController = TextEditingController();
  final _DescriptionController = TextEditingController();
  _BookingFormBodyState({required this.slot});

  @override
  Widget build(BuildContext context) {
    if (slot == '1') {
      duration = '11.00 am - 01.00 pm';
    } else if (slot == '2') {
      duration = '02.00 pm - 04.00 pm';
    } else {
      duration = '05.00 pm - 07.00 pm';
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
        child: Column(
          children: [
            View<BookingFormViewModel>(
                builder: (_, viewmodel) => Column(
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('Date: $tomorrowDate',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('Slot: ' + duration,
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('Event Name: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: _eventNameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(40, 40, 41, 1),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color:
                                        const Color.fromRGBO(238, 29, 82, 1)),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Enter event name",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 13),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          child: Text('Description: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                  color: Colors.white)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          style: const TextStyle(color: Colors.white),
                          controller: _DescriptionController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromRGBO(40, 40, 41, 1),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 2,
                                    color:
                                        const Color.fromRGBO(238, 29, 82, 1)),
                                borderRadius: BorderRadius.circular(15)),
                            hintText: "Enter event description",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 13),
                          ),
                          maxLines: 10,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  onPrimary:
                                      const Color.fromRGBO(238, 29, 82, 1),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              onPressed: () async {
                                await viewmodel.addBooking(
                                    date: tomorrowDate.toString(),
                                    event_desc: _DescriptionController.text,
                                    event_name: _eventNameController.text,
                                    slot: slot);
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Booking()),
                                );
                              },
                              child: const Text(
                                'BOOK',
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                ),
                              )),
                        )
                      ],
                    )),
          ],
        ),
      ),
    );
  }
}
