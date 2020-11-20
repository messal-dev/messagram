import 'package:flutter/material.dart';

import './utilities.dart';
import './stories_screen.dart';
import './online_screen.dart';

class PeopleScreen extends StatefulWidget {
  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  int index;

  @override
  void initState() {
    index = 0;
    super.initState();
  }

  _changeIndexListener(int indx) {
    setState(() {
      index = indx;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          _optionBuilder(),
          Expanded(
            child: IndexedStack(
              index: index,
              children: [
                StoriesScreen(),
                OnlineScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Container _optionBuilder() {
    return Container(
      padding: const EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            alignment: Alignment.center,
            child: _optionItemBuilder('STORIES (98)', 0),
          ),
          Container(
            alignment: Alignment.center,
            child: _optionItemBuilder('ACTIVES (205)', 1),
          ),
        ],
      ),
    );
  }

  InkWell _optionItemBuilder(String title, int indx) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      onTap: () => _changeIndexListener(indx),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        decoration: index == indx
            ? BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.circular(20),
              )
            : null,
        child: Text(
          title,
          style: TextStyle(
            color: index == indx ? Colors.white : Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
