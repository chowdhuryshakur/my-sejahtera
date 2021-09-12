import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:simple_blog_app/views/checkIn.dart';
import 'package:simple_blog_app/views/home.dart';
import 'package:simple_blog_app/views/profile.dart';
import 'package:simple_blog_app/views/statistics.dart';

class Layout extends StatefulWidget {
  Layout({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _LayoutState createState() => _LayoutState();
}

int _selectedIndex = 0;
final tabs = [HomePage(), Statistics(), CheckIn(), Profile()];

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
        body: tabs[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("img/home-icon.png"),
                ),
                label: 'MySejahtera',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("img/statistic.png"),
                ),
                label: 'Statistics',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("img/checkin.png"),
                ),
                label: 'Check-in',
              ),
              BottomNavigationBarItem(
                icon: ImageIcon(
                  AssetImage("img/person.png"),
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xff3A83FF),
            onTap: _onItemTapped));
  }
}
