import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map_mvvm/map_mvvm.dart';
import 'package:qidgym_management_system/ui/member_interface.dart';
import 'package:qidgym_management_system/ui/moderator_interface.dart';
import 'package:qidgym_management_system/ui/wrapper_view_model.dart';

class Wrapper extends StatelessWidget {
  final User user;
  const Wrapper({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return View<WrapperViewmodel>(builder: (_, viewmodel) {
      return FutureBuilder<String>(
        future: viewmodel.getUserType(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return _showProgressIndicator();
            } else {
              if (snapshot.data == "member") {
                return MainInterfaces(user: user);
              } else if (snapshot.data == "moderator") {
                return ModeratorInterfaces(user: user);
              } else {
                // print(snapshot.data);
                return MainInterfaces(user: user);
              }
            }
          } else if (snapshot.hasError) {
            Text('no data');
          }
          return _showProgressIndicator();
          // return Center(
          //       child: CircularProgressIndicator(),
          //     );
        },
      );
    });
  }
}

Widget _showProgressIndicator() {
  return Scaffold(
    backgroundColor: Color.fromRGBO(237, 231, 226, 1.0),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Loading',
            ),
            CircularProgressIndicator(
              semanticsLabel: 'Linear progress indicator',
            ),
          ],
        ),
      ),
    ),
  );
}
