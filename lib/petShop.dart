class Petshop {
  String name;
  String imageUrl;
  int duration;
  List<Details> details;
  Petshop(this.name, this.imageUrl, this.duration, this.details);

  static List<Petshop> samples = [
    Petshop(
      'Pet Hotel A',
      'assets/petshopA.jpg',
      1,
      [
        Details(10, 3.50, 35),
      ],
    ),
    Petshop(
      'Pet Hotel B',
      'assets/petshopB.png',
      1,
      [
        Details(5, 4.50, 45),
      ],
    ),
    Petshop(
      'Pet Hotel C',
      'assets/petshopC.png',
      1,
      [
        Details(20, 2.50, 25),
      ],
    )
  ];
}

class Details {
  int petSpace;
  double boardRateHr;
  double boardRateDaily;
  Details(this.petSpace, this.boardRateHr, this.boardRateDaily);
}
