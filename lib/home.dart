import 'accountPage.dart';
import 'package:flutter/material.dart';
import 'petShop.dart';
import 'petShopDetail.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Pet Boarding', style: Theme.of(context).textTheme.headline6),
        backgroundColor: const Color.fromARGB(255, 255, 197, 51),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: Petshop.samples.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return petShopDetail(petshop: Petshop.samples[index]);
                    },
                  ),
                );
              },
              child: buildShopCard(Petshop.samples[index]),
            );
          },
        ),
      ),
    );
  }

  Widget buildShopCard(Petshop petshop) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Padding(
        padding: const EdgeInsets.all(5.5),
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage(petshop.imageUrl),
              height: 250,
              width: double.infinity,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(petshop.name, style: Theme.of(context).textTheme.headline6)
          ],
        ),
      ),
    );
  }
}
