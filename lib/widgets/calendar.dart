import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class calendar extends StatelessWidget {
  const calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red.shade900,
        leading: Builder(
          builder: (BuildContext context) {
            return Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                splashColor: Colors.greenAccent,
                icon: const Icon(
                  color: Colors.white,
                  Icons.arrow_circle_left_outlined,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            );
          },
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 120),
            Text(
              'Schedule for Meeting',
              style: GoogleFonts.galdeano(fontSize: 30),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade500,
                          offset: const Offset(4.0, 2.0),
                          blurRadius: 5.0,
                          spreadRadius: 1.0)
                    ]),
                child: CalendarDatePicker(
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.utc(2024),
                  onDateChanged: (DateTime value) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
