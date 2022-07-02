import 'package:flutter/material.dart';
import 'package:qidgym_management_system/ui/screens/booking/customer/booking_pdf_api.dart';

import 'booking_pdf_paragraph_api.dart';

class bookingPdf extends StatefulWidget {
  const bookingPdf({Key? key}) : super(key: key);

  @override
  State<bookingPdf> createState() => _bookingPdfState();
}

class _bookingPdfState extends State<bookingPdf> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Print PDF"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  final pdfFile =
                      await PdfApi.generateCenteredText('Sample Text');

                  PdfApi.openFile(pdfFile);
                  // print(Text("hoiiii"));
                },
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Text("Centered Text"),
                )),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  final pdfFile = await PdfParagraphApi.generate();

                  PdfApi.openFile(pdfFile);
                },
                child: Text("Paragraph"))
          ],
        ),
      ),
    );
  }
}
