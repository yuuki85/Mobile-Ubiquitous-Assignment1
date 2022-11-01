import 'accountPage.dart';
import 'package:flutter/material.dart';
import 'petShop.dart';

class petShopDetail extends StatefulWidget {
  final Petshop petshop;
  const petShopDetail({Key? key, required this.petshop}) : super(key: key);
  @override
  petShopDetailState createState() {
    return petShopDetailState();
  }
}

int _sliderVal = 1;
int _itemCount = 0;
int _totalPrice = 0;

enum feeType { hourly, daily }

class petShopDetailState extends State<petShopDetail> {
  final myController = TextEditingController();
  feeType? _fee = feeType.hourly;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.petshop.name,
            style: Theme.of(context).textTheme.headline6),
        iconTheme: Theme.of(context).iconTheme,
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image(image: AssetImage(widget.petshop.imageUrl)),
            ),
            const SizedBox(
              height: 4,
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                itemCount: widget.petshop.details.length,
                itemBuilder: (BuildContext context, int index) {
                  final detail = widget.petshop.details[index];
                  final petshop = widget.petshop;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Text(
                            'Hourly fees ($_sliderVal hrs):'
                            '\nRM ${detail.boardRateHr * _itemCount * _sliderVal}',
                            style: Theme.of(context).textTheme.headline3),
                        leading: Radio(
                          value: feeType.hourly,
                          groupValue: _fee,
                          onChanged: (feeType? value) {
                            setState(() {
                              _fee = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(
                            'Daily fees (${petshop.duration} days):'
                            '\nRM ${detail.boardRateDaily * _itemCount * _sliderVal}',
                            style: Theme.of(context).textTheme.headline3),
                        leading: Radio(
                          value: feeType.daily,
                          groupValue: _fee,
                          onChanged: (feeType? value) {
                            setState(() {
                              _fee = value;
                            });
                          },
                        ),
                      ),
                      /*//need to have a radio button to allow selection of type of fees================================================
                      Text(
                          'Hourly fees:      RM ${detail.boardRateHr * _itemCount * _sliderVal} per hour.'
                          "\n"
                          'Daily fees:         RM ${detail.boardRateDaily * _itemCount * _sliderVal} per daily.'
                          "\n"
                          'Spaces:              ${detail.petSpace - _itemCount} spaces left',
                          style: Theme.of(context).textTheme.headline3),
                      */
                      const SizedBox(
                        height: 15,
                      ),

                      Row(
                          mainAxisAlignment: MainAxisAlignment
                              .center, //Center Row contents horizontally,
                          crossAxisAlignment: CrossAxisAlignment
                              .center, //Center Row contents vertically,
                          children: [
                            //need to check kalau boleh dia push ke atas
                            //Quantity of cats slider
                            Text('Number of Cats:    ',
                                style: Theme.of(context).textTheme.headline3),
                            _itemCount != 0
                                ? IconButton(
                                    icon: new Icon(Icons.remove),
                                    onPressed: () =>
                                        setState(() => _itemCount--))
                                : IconButton(
                                    icon: new Icon(Icons.remove),
                                    onPressed: () => null),
                            Text(_itemCount.toString(),
                                style: Theme.of(context).textTheme.headline3),
                            IconButton(
                                icon: new Icon(Icons.add),
                                onPressed: () => setState(() => _itemCount++)),
                          ]),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('Duration: $_sliderVal',
                          style: Theme.of(context).textTheme.headline3),
                      Slider(
                        min: 1,
                        max: 10,
                        divisions: 10,
                        label: '${_sliderVal * widget.petshop.duration} ',
                        value: _sliderVal.toDouble(),
                        onChanged: (newValue) {
                          setState(() {
                            _sliderVal = newValue.round();
                          });
                        },
                        activeColor: Colors.green,
                        inactiveColor: Colors.black,
                      ),

                      //trying to create promo textfield feature======================================================================
                      TextField(
                          controller: myController,
                          decoration: const InputDecoration(
                              //border: OutlineInputBorder(),
                              filled: true,
                              labelText: 'Enter Promo Code')),
                      //need to add total payment label and rating features===========================================================
                      const SizedBox(
                        height: 25,
                      ),

                      Text(
                          'Total Price: RM${_fee == feeType.hourly ? detail.boardRateHr * _itemCount * _sliderVal : detail.boardRateDaily * _itemCount * _sliderVal}',
                          style: Theme.of(context).textTheme.headline2),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}