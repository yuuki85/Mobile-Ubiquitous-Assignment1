import 'accountPage.dart';
import 'package:flutter/material.dart';
import 'petShop.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class petShopDetail extends StatefulWidget {
  final Petshop petshop;
  const petShopDetail({Key? key, required this.petshop}) : super(key: key);
  @override
  petShopDetailState createState() {
    return petShopDetailState();
  }
}

enum feeType { hourly, daily }

class petShopDetailState extends State<petShopDetail> {
  final myController = TextEditingController();

  feeType? _fee = feeType.hourly;
  int _sliderVal = 1;
  int _itemCount = 1;
  final String _discountCode = 'PET20221212';
  String value1 = "";

  Future<void> _showSimpleDialog() async {
    await showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.check,
                        size: 75.0,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('Thankyou for your booking.',
                          style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(
                        height: 15,
                      ),
                      Text('Please rate our service:',
                          style: Theme.of(context).textTheme.bodyText1),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context); //close Dialog
                        },
                        child: Text('Close',
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                    ]),
              ),
            ],
          );
        });
  }

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
            Expanded(
              child: ListView.builder(
                itemCount: widget.petshop.details.length,
                itemBuilder: (BuildContext context, int index) {
                  final detail = widget.petshop.details[index];

                  double hrFees = detail.boardRateHr * _itemCount * _sliderVal;
                  double dailyFees =
                      detail.boardRateDaily * _itemCount * _sliderVal;
                  int petSpaces = detail.petSpace - _itemCount;
                  double total = _fee == feeType.hourly
                      ? _discountCode == value1
                          ? (detail.boardRateHr * _itemCount * _sliderVal) *
                              80 /
                              100
                          : detail.boardRateHr * _itemCount * _sliderVal
                      : _discountCode == value1
                          ? (detail.boardRateDaily * _itemCount * _sliderVal) *
                              80 /
                              100
                          : detail.boardRateDaily * _itemCount * _sliderVal;

                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child:
                              Image(image: AssetImage(widget.petshop.imageUrl)),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(50, 10, 50, 0),
                            child: Column(children: [
                              ListTile(
                                title: Text(
                                    'Hourly fees ($_sliderVal hrs):'
                                    '\nRM ${hrFees.toStringAsFixed(2)}',
                                    style:
                                        Theme.of(context).textTheme.headline3),
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
                                    'Daily fees ($_sliderVal days):'
                                    '\nRM ${dailyFees.toStringAsFixed(2)}',
                                    style:
                                        Theme.of(context).textTheme.headline3),
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
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .center, //Center Row contents horizontally,
                                  crossAxisAlignment: CrossAxisAlignment
                                      .center, //Center Row contents vertically,
                                  children: [
                                    Text('Number of Pets:    ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3),
                                    _itemCount != 1
                                        ? IconButton(
                                            icon: new Icon(Icons.remove),
                                            color: Colors.black,
                                            onPressed: () =>
                                                setState(() => _itemCount--))
                                        : IconButton(
                                            icon: new Icon(Icons.remove),
                                            color: Colors.grey,
                                            onPressed: () => null),
                                    Text(_itemCount.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline3),
                                    _itemCount != detail.petSpace
                                        ? IconButton(
                                            icon: new Icon(Icons.add),
                                            color: Colors.black,
                                            onPressed: () =>
                                                setState(() => _itemCount++))
                                        : IconButton(
                                            icon: new Icon(Icons.add),
                                            color: Colors.grey,
                                            onPressed: () => null),
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
                                label:
                                    '${_sliderVal * widget.petshop.duration} ',
                                value: _sliderVal.toDouble(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _sliderVal = newValue.round();
                                  });
                                },
                                activeColor:
                                    const Color.fromARGB(255, 255, 197, 51),
                                inactiveColor: Colors.grey,
                              ),
                              TextField(
                                controller: myController,
                                decoration: const InputDecoration(
                                    //border: OutlineInputBorder(),
                                    filled: true,
                                    labelText: 'Enter Promo Code'),
                                onChanged: (text) {
                                  setState(() {
                                    value1 = text;
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Text('Price: RM${total.toStringAsFixed(2)}',
                                  style: Theme.of(context).textTheme.headline2),
                              Text('Spaces left: $petSpaces spaces'),
                              const SizedBox(
                                height: 25,
                              ),
                              ElevatedButton(
                                onPressed: _showSimpleDialog,
                                child: Text('Submit',
                                    style:
                                        Theme.of(context).textTheme.headline3),
                              ),
                              const SizedBox(
                                height: 45,
                              ),
                            ])),
                      ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
