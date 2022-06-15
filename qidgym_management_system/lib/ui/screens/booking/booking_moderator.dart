import "package:flutter/material.dart";

class BookingModerator extends StatelessWidget {
  const BookingModerator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(24, 24, 24, 1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Booking [Moderator]",
          style: TextStyle(fontWeight: FontWeight.w800, fontSize: 32),
        ),
        shape: const Border(
            bottom: BorderSide(
          color: Colors.grey,
          width: 1,
          style: BorderStyle.solid,
        )),
      ),
      body: Container(
          decoration: BoxDecoration(color: Color.fromRGBO(24, 24, 24, 1)),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 8,
                child: SingleChildScrollView(
                    child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20.0,
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            child: const Text(
                              "Booking List",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )),
              ),
            ],
          )),
    );
  }
}
