import 'package:flutter/material.dart';

import 'utilities.dart';

import 'models/room_model.dart';
import 'models/contact_model.dart';

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: size.width,
        child: Column(
          children: [
            _searchBuilder(size),
            _roomsBuilder(),
            Divider(color: secondaryColor),
            for (int i = 0; i < contacts.length; i++)
              if ((i % 3) == 0 && (i > 0)) ...[
                _profileBuilder(contacts[i]),
                _adsBuilder()
              ] else
                _profileBuilder(contacts[i]),
          ],
        ),
      ),
    );
  }

  Container _adsBuilder() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 0,
            color: secondaryColor,
          ),
          top: BorderSide(
            width: 0,
            color: secondaryColor,
          ),
        ),
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 55,
                height: 55,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryColor,
                  image: DecorationImage(
                    image: AssetImage('assets/sakuna.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 5,
                right: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: secondaryColor,
                      width: 2,
                    ),
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Messal Dev Freelancer',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 3,
                        horizontal: 5,
                      ),
                      margin: const EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        'Ad',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 3),
                Row(
                  children: [
                    Icon(
                      Icons.description,
                      color: Colors.orange,
                    ),
                    Expanded(
                      child: Text(
                        'I\'m a programmer. I\'m finding One Piece.',
                        softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  'View More',
                  style: TextStyle(color: Colors.blue, fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(width: 15),
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: secondaryColor,
              image: DecorationImage(
                image: AssetImage('assets/shikamaru.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _profileBuilder(Contact contact) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: contact.isStory ? const EdgeInsets.all(3) : null,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
              gradient: contact.isViewed
                  ? null
                  : LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.red, Colors.yellow, Colors.pink],
                    ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                contact.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      contact.name,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '10:11 pm',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    children: [
                      if (contact.replier != contact.name) ...[
                        Text(
                          '${contact.replier}:',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                      Expanded(
                        child: Container(
                          child: Text(
                            contact.reply,
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      if (contact.countUnread > 0)
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: contact.countUnread > 10
                                ? secondaryColor
                                : Colors.blue,
                            borderRadius: contact.countUnread > 99
                                ? BorderRadius.circular(20)
                                : null,
                            shape: contact.countUnread > 99
                                ? BoxShape.rectangle
                                : BoxShape.circle,
                          ),
                          child: Text(
                            '${contact.countUnread}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView _roomsBuilder() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _roomBuilder(
            'Create Room',
            '',
            false,
          ),
          ...rooms
              .map((room) => _roomBuilder(room.name, room.imgUrl, true))
              .toList(),
        ],
      ),
    );
  }

  Container _roomBuilder(
    String title, [
    String imgUrl = '',
    bool isActive = true,
  ]) {
    return Container(
      width: 60,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: secondaryColor,
                  image: imgUrl != ''
                      ? DecorationImage(
                          image: AssetImage(imgUrl),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: imgUrl == ''
                    ? Icon(
                        Icons.camera_enhance,
                        color: Colors.white,
                        size: 28,
                      )
                    : null,
              ),
              if (isActive == true)
                Positioned(
                  bottom: 7,
                  right: 0,
                  child: Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: secondaryColor,
                        width: 2,
                      ),
                      color: Colors.green,
                    ),
                  ),
                ),
            ],
          ),
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              height: 1.3,
            ),
          )
        ],
      ),
    );
  }

  Container _searchBuilder(Size size) {
    return Container(
      width: size.width,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text(
              'Search',
              style: TextStyle(
                color: Colors.grey[350],
                fontSize: 17,
              ),
            ),
          )
        ],
      ),
    );
  }
}
