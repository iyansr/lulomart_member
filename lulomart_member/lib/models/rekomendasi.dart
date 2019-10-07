class Rekomendasi {
  String name;
  String price;
  String picture;

  Rekomendasi({this.name, this.picture, this.price});

  factory Rekomendasi.fromJson(Map<String, dynamic> json) {
    return new Rekomendasi(
      name: json['product_name'] as String,
      price: json['product_price'] as String,
      picture: json['product_picture'] as String,
    );
  }
}
