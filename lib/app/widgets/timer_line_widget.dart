import 'package:flutter/material.dart';

class TimerLineWidget extends StatefulWidget {
  final String profile;
  final String name;
  final String picture;
  final String message;
  final int likes;
  final int comments;

  const TimerLineWidget({
    Key? key,
    required this.profile,
    required this.name,
    required this.picture,
    required this.message,
    required this.likes,
    required this.comments,
  }) : super(key: key);

  @override
  State<TimerLineWidget> createState() => _TimerLineWidgetState();
}

class _TimerLineWidgetState extends State<TimerLineWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    widget.profile,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              widget.name.toLowerCase(),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(widget.picture),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.comment,
                size: 25,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.send,
                size: 25,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.bookmark_border_outlined,
                size: 25,
              ),
            ),
          ],
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 10),
            child: Text(
              '${widget.likes} likes',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 5),
            child: Text(
              '${widget.name.toLowerCase()} ${widget.message}',
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 12,
              ),
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ],
    );
  }
}
