class Product {
  String name;
  String price;
  String picture;

  Product({this.name, this.picture, this.price});

  factory Product.fromJson(Map<String, dynamic> json) {
    return new Product(
      name: json['product_name'] as String,
      price: json['product_price'] as String,
      picture: json['product_picture'] as String,
    );
  }
}
