import "package:flutter/material.dart";

class Membership extends StatelessWidget {
  const Membership({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "   Membership",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
        ),
        shape: const Border(
            bottom: BorderSide(
          color: Colors.grey,
          width: 1,
          style: BorderStyle.solid,
        )),
      ),
      body: const Text("Membership"),
    );
  }
}
