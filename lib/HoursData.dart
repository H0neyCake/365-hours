import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoursData {
  String name;
  String catergory;
  IconData iconData;
  String rt;

  HoursData({this.name, this.catergory, this.iconData, this.rt});
}

List<HoursData> data = [
    HoursData(name: 'Programming', catergory: 'Technology', iconData: Icons.computer, rt: '/programming'),
    HoursData(name: 'Run', catergory: 'Sport', iconData: Icons.directions_run, rt: '/run'),
    HoursData(name: 'Bike', catergory: 'Sport', iconData: Icons.directions_bike, rt: '/bike'),
  ];

  