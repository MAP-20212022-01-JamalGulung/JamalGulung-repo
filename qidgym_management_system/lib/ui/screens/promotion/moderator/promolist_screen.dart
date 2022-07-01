import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/promotion/customer/viewpromotion_app_bar.dart';
import 'package:qidgym_management_system/ui/screens/promotion/customer/viewpromotion_body.dart';
import 'package:qidgym_management_system/ui/screens/promotion/moderator/promolist_app_bar.dart';
import 'package:qidgym_management_system/ui/screens/promotion/moderator/promolist_body.dart';

class PromoList extends StatefulWidget {
  const PromoList({Key? key}) : super(key: key);

  @override
  State<PromoList> createState() => PromoListState();
}

class PromoListState extends State<PromoList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(24, 24, 24, 1),
          appBar: PromoListAppBar(),
          body: PromoListBody()),
    );
  }
}
