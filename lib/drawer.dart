import 'package:flutter/material.dart';

import './utilities.dart';

class DrawerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Drawer(
      child: Container(
        color: primaryColor,
        child: ListView(
          children: [
            _headerBuilder(size),
            _optionBuilder('New Group', Icons.group),
            _optionBuilder('New Secret Chat', Icons.lock),
            _optionBuilder('New Channel', Icons.campaign),
            _optionBuilder('Contacts', Icons.person),
            Divider(),
            _optionBuilder('Settings', Icons.settings),
            _optionBuilder('Invite Friends', Icons.person_add),
            _optionBuilder('Help', Icons.help),
          ],
        ),
      ),
    );
  }

  ListTile _optionBuilder(String title, IconData icon) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }

  Container _headerBuilder(Size size) {
    return Container(
      color: secondaryColor,
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage('assets/messal.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Icon(
                Icons.wb_sunny,
                color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Siv D Messal',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '+855 962899400',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Icon(
                Icons.keyboard_arrow_down,
                color: Colors.white,
              ),
            ],
          )
        ],
      ),
    );
  }
}
