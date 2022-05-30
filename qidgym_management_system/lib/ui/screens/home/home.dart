import "package:flutter/material.dart";
import 'package:qidgym_management_system/services/world_time.dart';
import 'dart:developer';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
        appBar: AppBar(
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
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(color: Color.fromRGBO(40, 40, 40, 1)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      getDay(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 26,
                          color: Colors.white),
                    ),
                    Text(
                      "$currentDate",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 34,
                          color: Colors.white),
                    ),
                  ]),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.access_time,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "OPEN HOURS from 10AM to 8PM",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "Promotion",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 24),
            ),
            Text(
              "Recently Added",
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  // decoration: BoxDecoration(color: Color.fromRGBO(158, 27, 117, 0.5),borderRadius: BorderRadius.circular(10)),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/pink.jpg"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10)),
                  height: 280,
                  width: 160,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(158, 27, 117, 0.6),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Summer Body Challenge",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        )
                      ],
                    )
                  ]),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // decoration: BoxDecoration(color: Color.fromRGBO(27, 117, 158, 0.5),borderRadius: BorderRadius.circular(10)),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/blue.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                      height: 134,
                      width: 160,

                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(27, 117, 158, 0.6),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Merry May",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      // decoration: BoxDecoration(color: Color.fromRGBO(117, 158, 27, 0.5),borderRadius: BorderRadius.circular(10)),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/yellow.jpg"),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10)),
                      height: 134,
                      width: 160,

                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(117, 158, 27, 0.6),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Zumba Raya",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  ],
                )
              ],
            ),
          ]),
        ));
  }
}

String getDay(){
  String day = "";

  if (currentDay == "Sunday") {
    day = "Sun";
  } else if (currentDay == "Monday") {
    day = "Mon";
  } else if (currentDay == "Tuesday") {
    day = "Tue";
  } else if (currentDay == "Wednesday") {
    day = "Wed";
  } else if (currentDay == "Thursday") {
    day = "Thu";
  } else if (currentDay == "Friday") {
    day = "Fri";
  } else if (currentDay == "Saturday") {
    day = "Sat";
  }

  return day;
}