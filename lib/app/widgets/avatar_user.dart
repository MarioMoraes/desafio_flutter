import 'package:flutter/material.dart';

Widget avatarUser({
  required String imageUrl,
  required bool live,
  required String name,
}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.pink,
              Colors.red.shade100,
              Colors.blue,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      CircleAvatar(
        radius: 27,
        backgroundImage: NetworkImage(imageUrl),
      ),
      Positioned(
        bottom: 0,
        child: SizedBox(
          width: 60,
          child: Center(
            child: Text(
              name.toLowerCase(),
              style: const TextStyle(color: Colors.white, fontSize: 12),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
      live
          ? Positioned(
              bottom: 15,
              child: Container(
                width: 40,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.red.shade800,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Live',
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            )
          : const SizedBox(),
    ],
  );
}
