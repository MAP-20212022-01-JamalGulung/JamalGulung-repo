import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/promotion/customer/viewpromotion_app_bar.dart';
import 'package:qidgym_management_system/ui/screens/promotion/customer/viewpromotion_body.dart';

class ViewPromo extends StatefulWidget {
  final String docId;
  const ViewPromo({Key? key, required this.docId}) : super(key: key);

  @override
  State<ViewPromo> createState() => ViewPromoState(docId: this.docId);
}

class ViewPromoState extends State<ViewPromo> {
  String docId;
  ViewPromoState({required this.docId});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Color.fromRGBO(24, 24, 24, 1),
          appBar: ViewPromotionAppBar(),
          body: ViewPromotionBody(
            docId: docId,
          )),
    );
  }
}
