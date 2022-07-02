import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/home/customer/home_customer_appbar.dart';
import 'package:qidgym_management_system/ui/screens/home/customer/home_customer_body.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:qidgym_management_system/ui/screens/home/customer/home_view_chatBox.dart';

class HomeCustomer extends StatefulWidget {
  const HomeCustomer({Key? key}) : super(key: key);

  @override
  State<HomeCustomer> createState() => _HomeCustomerState();
}

class _HomeCustomerState extends State<HomeCustomer> {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Color.fromRGBO(24, 24, 24, 1));
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(24, 24, 24, 1),
        appBar: HomeCustomerAppBar(),
        body: HomeCustomerBody(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ChatScreen()));
          },
          label: const Text('Ask Me'),
          icon: const Icon(Icons.headset_mic_rounded),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
