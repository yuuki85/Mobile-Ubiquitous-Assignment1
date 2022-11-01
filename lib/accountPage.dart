// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'petBoardTheme.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key? key}) : super(key: key);
  @override
  RateCourseState createState() => RateCourseState();
}

class RateCourseState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Details',
            style: Theme.of(context).textTheme.headline6),
        iconTheme: Theme.of(context).iconTheme,
      ),
    );
  }
}
