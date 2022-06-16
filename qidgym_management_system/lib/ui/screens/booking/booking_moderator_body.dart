import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';

import '../../../model/booking.dart';
import 'booking_moderator_details_body.dart';
import 'booking_moderator_viewmodel.dart';

class BookingModeratorBody extends StatefulWidget {
  static Route route() =>
      MaterialPageRoute(builder: (_) => BookingModeratorBody());

  @override
  _BookingModeratorBody createState() => _BookingModeratorBody();
}

class _BookingModeratorBody extends State<BookingModeratorBody> {
  @override
  Widget build(BuildContext context) {
    return View<BookingModeratorViewModel>(
      shouldRebuild: false,
      builder: (_, viewmodel) => SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(24, 24, 24, 1),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Booking List",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              StreamBuilder<List<BookingModel>>(
                  stream: viewmodel.readBookingList(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final booking = snapshot.data!;
                      return Row(children: <Widget>[
                        Expanded(
                          child: ListView(
                            shrinkWrap: true,
                            children: booking.map((booking) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Card(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(11, 181, 142, 100),
                                      )),
                                  margin:
                                      EdgeInsets.fromLTRB(12.0, 1.0, 12.0, 2.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ListTile(
                                      title: Text(
                                        'Event Name: ' + booking.event_name,
                                        style: TextStyle(fontSize: 17),
                                      ),
                                      subtitle: Text(booking.event_desc),
                                      trailing: Text(
                                        "Pending",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                111, 48, 49, 41)),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookingModeratorDetailsBody(
                                                        post: booking)));
                                      },
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        )
                      ]);
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
