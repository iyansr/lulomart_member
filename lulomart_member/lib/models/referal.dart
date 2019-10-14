class Referal {
  String name;
  String price;
  String picture;

  Referal({this.name, this.picture, this.price});

  factory Referal.fromJson(Map<String, dynamic> json) {
    return new Referal(
      name: json['product_name'] as String,
      price: json['product_price'] as String,
      picture: json['product_picture'] as String,
    );
  }
}
