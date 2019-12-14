import 'package:flutter/material.dart';
import 'package:hours365/HoursList.dart';
import 'package:hours365/routes/Programming.dart';
import 'package:hours365/routes/bike.dart';
import 'package:hours365/routes/run.dart';

void main() => runApp(Hours365());

class Hours365 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '365 Hours',
      theme: ThemeData(primaryColor: Colors.white),
      home: HoursList(),
      routes: {
        '/run': (context) => Run(),
        '/programming': (context) => Programming(),
        '/bike': (context) => Bike(),
      },
    );
  }
}
