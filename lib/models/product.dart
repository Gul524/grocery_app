class Product {
  int id;
  int categoryId;
  String name;
  double price;
  double discountPercent;
  double discountAmount;
  bool isDiscounted;
  int quantity;
  List<ProductFlavour> flavours;
  List<ProductSize> sizes;

  Product({
    this.id = 0,
    this.categoryId = 0,
    this.name = "",
    this.price = 0.0,
    this.quantity = 0,
    this.flavours = const [],
    this.sizes = const [],
    this.isDiscounted = false,
    this.discountPercent = 0.0,
    this.discountAmount = 0.0,
  });

  Product copyWidth({
    int? id,
    int? categoryId,
    String? name,
    double? price,
    int? quantity,
    List<ProductFlavour>? flavours,
    List<ProductSize>? sizes,
    bool? isDiscounted,
    double? discountPercent,
    double? discountAmount,
  }) {
    return Product(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      flavours: flavours ?? this.flavours,
      sizes: sizes ?? this.sizes,
      isDiscounted: isDiscounted ?? this.isDiscounted,
      discountPercent: discountPercent ?? this.discountPercent,
      discountAmount: discountAmount ?? this.discountAmount,
    );
  }
}

class ProductSize {
  int id;
  String name;
  double extraAmount;

  ProductSize({this.id = 0, this.name = "", this.extraAmount = 0.0});

  ProductSize copyWith({int? id, String? name, double? extraAmount}) {
    return ProductSize(
    id : id ?? this.id,
    name: name ?? this.name,
    extraAmount: extraAmount ?? this.extraAmount
    );
  }
}

class ProductFlavour {
  int id;
  String name;
  double extraAmount;

  ProductFlavour({this.id = 0, this.name = "", this.extraAmount = 0.0});

  ProductFlavour copyWith({int? id, String? name, double? extraAmount}) {
    return ProductFlavour(
    id : id ?? this.id,
    name: name ?? this.name,
    extraAmount: extraAmount ?? this.extraAmount
    );
  }
}
