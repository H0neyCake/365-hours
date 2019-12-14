import 'package:flutter/material.dart';
import 'package:hours365/HoursData.dart';

class HoursList extends StatefulWidget {
  HoursList({Key key}) : super(key: key);

  @override
  _HoursListState createState() => _HoursListState();
}

class _HoursListState extends State<HoursList> {
  int _selectedIndex = 0;

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
        backgroundColor: Colors.white,
      ),
      body: _selectedIndex == 0
          ? Container(child: ListView(children: _buildList(context)))
          : (_selectedIndex == 1
              ? (favoriteData.isNotEmpty
                  ? Container(
                      child: ListView(children: _pushFavorites(context)))
                  : Center(
                      child: Text('Favorits is empty!\nSorry :(',
                      textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18.0, color: Colors.grey)),
                    ))
              : Text('Settings')),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.list), title: Text('List')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('Favorite')),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('Settings')),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
      ),
    );
  }

  List<Widget> _buildList(BuildContext context) {
    return data
        .map((HoursData f) => ListTile(
              title: Text(f.name),
              subtitle: Text('Category: ${f.catergory}'),
              leading: Icon(f.iconData),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    if (f.favorite) {
                      favoriteData.remove(f);
                      f.favorite = false;
                    } else {
                      favoriteData.add(f);
                      f.favorite = true;
                    }
                  });
                },
                child: Container(
                  child: Icon(
                    (f.favorite) ? Icons.favorite : Icons.favorite_border,
                    color: (f.favorite) ? Colors.red : Colors.grey,
                  ),
                ),
              ),
              onTap: () => Navigator.of(context).pushNamed(f.rt),
            ))
        .toList();
  }

  List<Widget> _pushFavorites(BuildContext context) {
    return favoriteData
        .map((HoursData f) => ListTile(
              title: Text(f.name),
              subtitle: Text('Category: ${f.catergory}'),
              leading: Icon(f.iconData),
              onTap: () => Navigator.of(context).pushNamed(f.rt),
              trailing: GestureDetector(
                onTap: () {
                  setState(() {
                    favoriteData.remove(f);
                    f.favorite = false;
                  });
                },
                child: Container(
                  child: Icon(
                    Icons.close,
                    color: Colors.red,
                  ),
                ),
              ),
            ))
        .toList();
  }
}
