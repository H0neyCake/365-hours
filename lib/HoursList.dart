import 'package:flutter/material.dart';
import 'package:hours365/HoursData.dart';

class HoursList extends StatefulWidget {
  HoursList({Key key}) : super(key: key);

  @override
  _HoursListState createState() => _HoursListState();
}

class _HoursListState extends State<HoursList> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    Center(),
    Text('Index 1', style: optionStyle),
    Text('Index 2', style: optionStyle),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('365 Hours'),
        ),
        body: _selectedIndex == 0 
        ? Container(child: ListView(children: _buildList(context))) 
        : (_selectedIndex == 1 ? Text('Favorits') : Text('Settings')),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('List')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('Favorite')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Settings')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        backgroundColor: Colors.yellow,
      ),
    );
  }

  List<Widget> _buildList(BuildContext context) {
    // final bool alreadySaved = false;
    return data
        .map((HoursData f) => ListTile(
              title: Text(f.name),
              subtitle: Text('Category: ${f.catergory}'),
              leading: Icon(f.iconData),
              // trailing: Icon(
              //   alreadySaved ? Icons.favorite : Icons.favorite_border,
              //   color: alreadySaved ? Colors.red : null,
              // ),
              onTap: () => Navigator.of(context).pushNamed(f.rt),
            ))
        .toList();
  }
}
