import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HoursData {
  String name;
  String catergory;
  IconData iconData;
  String rt;
  bool favorite;

  HoursData({this.name, this.catergory, this.iconData, this.favorite, this.rt});
}

List<HoursData> data = [
  HoursData(
      name: 'Programming',
      catergory: 'Technology',
      iconData: Icons.computer,
      favorite: false,
      rt: '/programming'),
  HoursData(
      name: 'Run',
      catergory: 'Sport',
      iconData: Icons.directions_run,
      favorite: false,
      rt: '/run'),
  HoursData(
      name: 'Bike',
      catergory: 'Sport',
      iconData: Icons.directions_bike,
      favorite: false,
      rt: '/bike'),
];

List<HoursData> favoriteData = new List<HoursData>();