import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({Key? key})
      : super(
          key: key,
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.black,
          title: const Text(
            'Instagram',
            style: TextStyle(
              fontSize: 36,
              fontFamily: 'Birthstone',
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: 27,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                size: 27,
              ),
            ),
          ],
        );
}
