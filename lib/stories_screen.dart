import 'dart:math';

import 'package:flutter/material.dart';

import './models/contact_model.dart';

class StoriesScreen extends StatelessWidget {
  final List<Contact> contactList =
      contacts.where((contact) => contact.isStory == true).toList();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: GridView.count(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        children: [
          _storyItemBuilder(
            'Siv D Messal',
            'assets/messal.jpg',
            'assets/messal.jpg',
            0,
          ),
          _storyItemBuilder(
            'Roronoa Zoro',
            'assets/zoro.jpg',
            'assets/konoha.jpg',
            5,
          ),
          ...contactList
              .map(
                (contact) => _storyItemBuilder(
                  contact.name,
                  contact.imgUrl,
                  contact.storyUrl,
                  1 + Random().nextInt(10),
                ),
              )
              .toList(),
        ],
      ),
    );
  }

  Stack _storyItemBuilder(
      String name, String imageUrl, String storyUrl, int countStory) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(storyUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Positioned(
          child: Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
            ),
          ),
          bottom: 10,
          left: 10,
        ),
        if (countStory > 0)
          Positioned(
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.black87,
                shape: BoxShape.circle,
              ),
              child: Text(
                '$countStory',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
            top: 10,
            right: 10,
          ),
        if (countStory > 0)
          Positioned(
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.blue,
                  width: 2,
                ),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            top: 10,
            left: 10,
          ),
        if (countStory <= 0)
          Positioned(
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.control_point),
            ),
            top: 10,
            left: 10,
          ),
      ],
    );
  }
}
