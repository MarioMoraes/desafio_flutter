import 'dart:convert';

import 'package:desafio_flutter/app/model/user.dart';
import 'package:desafio_flutter/app/widgets/custom_appbar.dart';
import 'package:desafio_flutter/app/widgets/timer_line_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'model/time_line.dart';
import 'widgets/avatar_user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var users = <User>[];
  var timeline = <TimeLine>[];

  @override
  void initState() {
    super.initState();
    _loadUsers();
    _loadTimeLine();
  }

  Future<void> _loadUsers() async {
    var usersData = await rootBundle.loadString('assets/json/hero.json');
    setState(() {
      users = jsonDecode(usersData)
          .map<User>((element) => User.fromMap(element))
          .toList();
    });
  }

  Future<void> _loadTimeLine() async {
    var timeLineData = await rootBundle.loadString('assets/json/timeline.json');
    setState(() {
      timeline = jsonDecode(timeLineData)
          .map<TimeLine>((element) => TimeLine.fromMap(element))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .15,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: avatarUser(
                          imageUrl: users[index].url,
                          live: users[index].live,
                          name: users[index].name,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: timeline.length,
                  itemBuilder: (_, index) {
                    return TimerLineWidget(
                      profile: timeline[index].profile,
                      name: timeline[index].name,
                      picture: timeline[index].picture,
                      message: timeline[index].message,
                      likes: timeline[index].likes,
                      comments: timeline[index].comments,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
