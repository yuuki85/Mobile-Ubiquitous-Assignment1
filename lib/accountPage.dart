// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:asgmt1_pet_board/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'petBoardTheme.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key? key}) : super(key: key);

  @override
  accountPageDetailState createState() {
    return accountPageDetailState();
  }
}

class accountPageDetailState extends State<accountPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Details Registration',
              style: Theme.of(context).textTheme.headline6),
          iconTheme: Theme.of(context).iconTheme,
        ),
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                child: Column(children: [
                  const SizedBox(height: 30),
                  Text('Detail Registration:',
                      style: Theme.of(context).textTheme.headline2),
                  const SizedBox(height: 30),
                  TextFormField(
                    decoration: const InputDecoration(
                        //border: OutlineInputBorder(),
                        filled: true,
                        labelText: 'Enter Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Name required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                        //border: OutlineInputBorder(),
                        filled: true,
                        labelText: 'Enter Address'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Address required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                        //border: OutlineInputBorder(),
                        filled: true,
                        labelText: 'Enter Phone Number'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Phone Number required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    decoration: const InputDecoration(
                        //border: OutlineInputBorder(),
                        filled: true,
                        labelText: 'Enter Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '*Email required.';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15),
                ]),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Home();
                              },
                            ),
                          );
                        }
                      },
                      child: Text('Submit',
                          style: Theme.of(context).textTheme.headline3),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
