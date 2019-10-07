class Kategori {
  String id;
  String name;

  Kategori({this.name, this.id});

  factory Kategori.fromJson(Map<String, dynamic> json) {
    return new Kategori(
      id: json['productcategory_id'],
      name: json['productcategory_name'],
    );
  }
}
