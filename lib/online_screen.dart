import 'dart:ui';
import 'dart:math';

import 'package:flutter/material.dart';

import './utilities.dart';
import './models/contact_model.dart';

class OnlineScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _activeBuilder(
              'Create a Room',
              'Use a link to video chat with anyone',
              '',
              0,
            ),
            ...contacts
                .map(
                  (contact) => _activeBuilder(
                    contact.name,
                    '',
                    contact.imgUrl,
                    1 + Random().nextInt(10),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Container _activeBuilder(
    String name,
    String description,
    String imageUrl,
    int countOffline,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          Stack(
            children: [
              imageUrl != ''
                  ? Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_enhance,
                        color: Colors.white,
                      ),
                    ),
              if (countOffline > 0)
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: countOffline > 3
                      ? Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: primaryColor,
                              width: 1,
                            ),
                          ),
                        )
                      : Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 1,
                            horizontal: 3,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: primaryColor,
                              width: 2,
                            ),
                          ),
                          child: Text(
                            '${countOffline}m',
                            style: TextStyle(fontSize: 8),
                          ),
                        ),
                )
            ],
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  if (description != '')
                    Text(
                      description,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        height: 2,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
