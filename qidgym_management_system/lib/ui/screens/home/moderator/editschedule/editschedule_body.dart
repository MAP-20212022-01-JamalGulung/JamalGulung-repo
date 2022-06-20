import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/model/operationDetails.dart';
import 'package:qidgym_management_system/ui/screens/home/moderator/editschedule/editschedule_viewmodel.dart';

class EditScheduleBody extends StatefulWidget {
  const EditScheduleBody({Key? key}) : super(key: key);

  @override
  State<EditScheduleBody> createState() => _EditScheduleBodyState();
}

class _EditScheduleBodyState extends State<EditScheduleBody> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey _startKey = new GlobalKey();
  final GlobalKey _endKey = new GlobalKey();
  String start = "";
  String end = "";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 8.0),
        child: Column(children: [
          View<EditScheduleViewModel>(
            builder: (_, viewmodel) => Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text('Specify the opening hours:',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    StreamBuilder<List<OperationHour>>(
                        stream: viewmodel.readBooking('Monday'),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          final _OH = snapshot.data!;
                          return ListView(
                            shrinkWrap: true,
                            children: _OH.map(buildOHList).toList(),
                          );
                        }),
                    StreamBuilder<List<OperationHour>>(
                        stream: viewmodel.readBooking('Tuesday'),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          final _OH = snapshot.data!;
                          return ListView(
                            shrinkWrap: true,
                            children: _OH.map(buildOHList).toList(),
                          );
                        }),
                    StreamBuilder<List<OperationHour>>(
                        stream: viewmodel.readBooking('Wednesday'),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          final _OH = snapshot.data!;
                          return ListView(
                            shrinkWrap: true,
                            children: _OH.map(buildOHList).toList(),
                          );
                        }),
                    StreamBuilder<List<OperationHour>>(
                        stream: viewmodel.readBooking('Thursday'),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          final _OH = snapshot.data!;
                          return ListView(
                            shrinkWrap: true,
                            children: _OH.map(buildOHList).toList(),
                          );
                        }),
                    StreamBuilder<List<OperationHour>>(
                        stream: viewmodel.readBooking('Friday'),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          final _OH = snapshot.data!;
                          return ListView(
                            shrinkWrap: true,
                            children: _OH.map(buildOHList).toList(),
                          );
                        }),
                    StreamBuilder<List<OperationHour>>(
                        stream: viewmodel.readBooking('Saturdy'),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          final _OH = snapshot.data!;
                          return ListView(
                            shrinkWrap: true,
                            children: _OH.map(buildOHList).toList(),
                          );
                        }),
                    StreamBuilder<List<OperationHour>>(
                        stream: viewmodel.readBooking('Sunday'),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Something went wrong');
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text("Loading");
                          }
                          final _OH = snapshot.data!;
                          return ListView(
                            shrinkWrap: true,
                            children: _OH.map(buildOHList).toList(),
                          );
                        })
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget buildOHList(OperationHour OH) => SizedBox(
      child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
          child: Form(
            key: _formKey,
            child: Row(
              children: [
                MaterialButton(
                  color: const Color.fromRGBO(238, 29, 82, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {},
                  child: Text(
                    OH.day,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Row(
                //   children: [
                //     TextFormField(
                //       style: TextStyle(color: Colors.black),
                //       key: _startKey,
                //       initialValue: OH.start,
                //       decoration: InputDecoration(
                //         filled: true,
                //         fillColor: Colors.white,
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10)),
                //       ),
                //       validator: (val) =>
                //           val!.isEmpty ? 'Please enter open time' : null,
                //       onChanged: (val) {
                //         setState(() => start = val);
                //       },
                //     ),
                //     Text(" to "),
                //     TextFormField(
                //       style: TextStyle(color: Colors.black),
                //       key: _endKey,
                //       initialValue: OH.start,
                //       decoration: InputDecoration(
                //         filled: true,
                //         fillColor: Colors.white,
                //         focusedBorder: OutlineInputBorder(
                //             borderRadius: BorderRadius.circular(10)),
                //       ),
                //       validator: (val) =>
                //           val!.isEmpty ? 'Please enter open time' : null,
                //       onChanged: (val) {
                //         setState(() => start = val);
                //       },
                //     )
                //   ],
                // )
              ],
            ),
          )));
}
