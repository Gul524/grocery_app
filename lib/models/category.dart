import 'package:grocery_app/models/product.dart';

class Category {
  int id;
  String name;
  List<Product> products;

  Category({this.id = 0, this.name = "", this.products = const []});

  Category copyWith({int? id, String? name, List<Product>? products}) {
    return Category(
    id : id ?? this.id,
    name: name ?? this.name,
    products: products ?? this.products
    );
  }
}
