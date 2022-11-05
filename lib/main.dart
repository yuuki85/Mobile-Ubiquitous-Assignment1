import 'package:asgmt1_pet_board/accountPage.dart';
import 'package:flutter/material.dart';
import 'petBoardTheme.dart';
import 'home.dart';

void main() {
// 1
  runApp(const Asgnm1PetBoard());
}

class Asgnm1PetBoard extends StatelessWidget {
  const Asgnm1PetBoard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
// 2
    final theme = PetBoardTheme.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
// 3
      theme: theme,
      title: 'Pet Boarding',
      home: accountPage(),
    );
  }
}
