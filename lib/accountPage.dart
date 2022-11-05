// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:asgmt1_pet_board/home.dart';
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
        title: Text('Details', style: Theme.of(context).textTheme.headline6),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
            child: ElevatedButtonTheme(
              data: Theme.of(context).elevatedButtonTheme,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Home();
                      },
                    ),
                  );
                },
                child: Text('Submit',
                    style: Theme.of(context).textTheme.headline3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
