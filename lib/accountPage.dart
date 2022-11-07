// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:asgmt1_pet_board/home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'petBoardTheme.dart';
import 'package:intl/intl.dart';
import 'package:time_picker_widget/main.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key? key}) : super(key: key);

  @override
  accountPageDetailState createState() {
    return accountPageDetailState();
  }
}

enum petType { cats, dogs }

class accountPageDetailState extends State<accountPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController dateInput = TextEditingController();
  TextEditingController dateInput1 = TextEditingController();

  TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
  TimeOfDay time1 = TimeOfDay(hour: 10, minute: 30);

  petType? _pet = petType.cats;
  int _age = 1;

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
              Expanded(
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                    child: Column(children: [
                      const SizedBox(height: 30),
                      Text('User Registration:',
                          style: Theme.of(context).textTheme.headline2),
                      const SizedBox(height: 25),
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
                        validator: (value) => validateMobile(value),
                      ),
                      const SizedBox(height: 15),
                      TextFormField(
                        decoration: const InputDecoration(
                            //border: OutlineInputBorder(),
                            filled: true,
                            labelText: 'Enter Email'),
                        validator: (value) => validateEmail(value),
                      ),
                      const SizedBox(height: 35),
                      Text('Pet Registration:',
                          style: Theme.of(context).textTheme.headline2),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text('Pet Type:',
                              style: Theme.of(context).textTheme.headline3),
                          Radio(
                            value: petType.cats,
                            groupValue: _pet,
                            onChanged: (petType? value) {
                              setState(() {
                                _pet = value;
                              });
                            },
                          ),
                          Text('Cats',
                              style: Theme.of(context).textTheme.headline3),
                          Radio(
                            value: petType.dogs,
                            groupValue: _pet,
                            onChanged: (petType? value) {
                              setState(() {
                                _pet = value;
                              });
                            },
                          ),
                          Text('Dogs',
                              style: Theme.of(context).textTheme.headline3),
                        ],
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('Age:    ',
                                style: Theme.of(context).textTheme.headline3),
                            _age != 1
                                ? IconButton(
                                    icon: new Icon(Icons.remove),
                                    color: Colors.black,
                                    onPressed: () => setState(() => _age--))
                                : IconButton(
                                    icon: new Icon(Icons.remove),
                                    color: Colors.grey,
                                    onPressed: () => null),
                            Text('${_age.toString()} years old',
                                style: Theme.of(context).textTheme.headline3),
                            IconButton(
                                icon: new Icon(Icons.add),
                                color: Colors.black,
                                onPressed: () => setState(() => _age++)),
                          ]),
                      TextField(
                        controller: dateInput,
                        decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: "Enter Check-in Date"),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(formattedDate);
                            setState(() {
                              dateInput.text = formattedDate;
                            });
                          } else {}
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Check-in Time:',
                              style: Theme.of(context).textTheme.headline3),
                          TextButton(
                            onPressed: () async {
                              TimeOfDay? newTime = await showTimePicker(
                                  context: context, initialTime: time);

                              //if no button
                              if (newTime == null) return;

                              //if yes button
                              setState(() {
                                time = newTime;
                              });
                            },
                            child: Text(
                                '${time.hour.toString().padLeft(2, '0')}${time.minute} hrs',
                                style: Theme.of(context).textTheme.headline3),
                          ),
                        ],
                      ),
                      TextField(
                        controller: dateInput1,
                        decoration: InputDecoration(
                            icon: Icon(Icons.calendar_today),
                            labelText: "Enter Departure Date"),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100));

                          if (pickedDate != null) {
                            print(pickedDate);
                            String formattedDate =
                                DateFormat('dd-MM-yyyy').format(pickedDate);
                            print(formattedDate);
                            setState(() {
                              dateInput1.text = formattedDate;
                            });
                          } else {}
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Departure Time:',
                              style: Theme.of(context).textTheme.headline3),
                          TextButton(
                            onPressed: () async {
                              TimeOfDay? newTime = await showTimePicker(
                                  context: context, initialTime: time1);

                              //if no button
                              if (newTime == null) return;

                              //if yes button
                              setState(() {
                                time1 = newTime;
                              });
                            },
                            child: Text(
                                '${time1.hour.toString().padLeft(2, '0')}${time1.minute} hrs',
                                style: Theme.of(context).textTheme.headline3),
                          ),
                        ],
                      ),
                    ]),
                  ),
                ]),
              ),
              Align(
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
            ],
          ),
        ));
  }
}

String? validateMobile(String? value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regex.hasMatch(value)) {
    return 'Please enter valid mobile number';
  }
  return null;
}

String? validateEmail(String? value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty || !regex.hasMatch(value)) {
    return 'Enter a valid email address';
  } else {
    return null;
  }
}
