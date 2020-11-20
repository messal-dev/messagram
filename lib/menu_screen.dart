import 'package:flutter/material.dart';

import './utilities.dart';
import './drawer.dart';
import './chats_screen.dart';
import './people_screen.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: primaryColor,
      drawer: DrawerItem(),
      appBar: AppBar(
        backgroundColor: secondaryColor,
        title: Text('Messagram'),
        actions: [
          _actionBar(Icons.camera_alt),
          _actionBar(Icons.edit),
        ],
      ),
      body: IndexedStack(
        index: index,
        children: [
          ContactScreen(),
          PeopleScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        height: size.height * 0.08,
        color: secondaryColor,
        child: Row(
          children: [
            _bottomNavigationBar('Chats', Icons.sms, 0),
            _bottomNavigationBar('People', Icons.people, 1),
          ],
        ),
      ),
    );
  }

  Container _actionBar(IconData icon) {
    return Container(
      height: 40,
      width: 40,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: null,
      ),
    );
  }

  Expanded _bottomNavigationBar(String title, IconData icon, int indx) {
    return Expanded(
      child: InkWell(
        onTap: () {
          setState(() {
            index = indx;
          });
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: index == indx ? Colors.white : Colors.grey,
                size: 24,
              ),
              Text(
                title,
                style: TextStyle(
                  color: index == indx ? Colors.white : Colors.grey,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
