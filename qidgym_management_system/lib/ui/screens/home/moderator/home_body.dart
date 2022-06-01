import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:loading_indicator/loading_indicator.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/ui/screens/home/moderator/home_viewmodal.dart';

class HomeModeratorBody extends StatefulWidget {
  const HomeModeratorBody({Key? key}) : super(key: key);

  @override
  State<HomeModeratorBody> createState() => _HomeModeratorBody();
}

class _HomeModeratorBody extends State<HomeModeratorBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
      alignment: Alignment.center,
      child: Container(
        child: View<HomeModeratorViewModel>(
          builder: (_, viewmodel) => FutureBuilder<Map>(
              future: viewmodel.getOperationHour("Sunday"),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  Map<String, dynamic> data =
                      snapshot.data as Map<String, dynamic>;
                  Text(data['start']);
                }
                return Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    LoadingIndicator(
                        indicatorType: Indicator.ballClipRotatePulse,
                        colors: const [Color.fromRGBO(238, 29, 82, 1)],
                        strokeWidth: 2,
                        backgroundColor: Color.fromRGBO(24, 24, 24, 1),
                        pathBackgroundColor: Color.fromRGBO(24, 24, 24, 1)),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
