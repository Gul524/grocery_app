import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
part 'model.g.dart'; // GENERATED FILE


@JsonSerializable()
class Deal {
  String id;
  String name;
  List<Product> items;

  Deal({
    this.id = "0",
    this.name = "",
    this.items = const [],
  });

  Deal copyWith({
    String? id,
    String? name,
    List<Product>? items,
  }) {
    return Deal(
      id: id ?? this.id,
      name: name ?? this.name,
      items: items ?? this.items,
    );
  }

  factory Deal.fromJson(Map<String, dynamic> json) => _$DealFromJson(json);
  Map<String, dynamic> toJson() => _$DealToJson(this);
}


@JsonSerializable()
class Category {
  String id;
  String name;
  List<Product> products;

  Category({this.id = "0", this.name = "", this.products = const []});

  Category copyWith({String? id, String? name, List<Product>? products}) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      products: products ?? this.products,
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class Product {
  String id;
  @JsonKey(fromJson: stringToUint8, toJson: uint8ToString)
  Uint8List? imageBytes;
  int categoryId;
  String name;
  String description;
  int price;
  int discountPercent;
  int discountAmount;
  bool isDiscounted;
  int quantity;
  List<ProductVariation> variations;

  Product({
    this.id = "0",
    this.imageBytes,
    this.categoryId = 0,
    this.name = "",
    this.description = "",
    this.price = 0,
    this.quantity = 0,
    this.variations = const [],
    this.isDiscounted = false,
    this.discountPercent = 0,
    this.discountAmount = 0,
  });

  Product copyWith({
    String? id,
    Uint8List? imageBytes,
    int? categoryId,
    String? name,
    String? description,
    int? price,
    int? quantity,
    List<ProductVariation>? variations,
    bool? isDiscounted,
    int? discountPercent,
    int? discountAmount,
  }) {
    return Product(
      id: id ?? this.id,
      imageBytes: imageBytes ?? this.imageBytes,
      categoryId: categoryId ?? this.categoryId,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
      variations: variations ?? this.variations,
      isDiscounted: isDiscounted ?? this.isDiscounted,
      discountPercent: discountPercent ?? this.discountPercent,
      discountAmount: discountAmount ?? this.discountAmount,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class ProductVariation {
  String name;
  double extraAmount;

  ProductVariation({this.name = "", this.extraAmount = 0.0});

  ProductVariation copyWith({String? id, String? name, double? extraAmount}) {
    return ProductVariation(
      name: name ?? this.name,
      extraAmount: extraAmount ?? this.extraAmount,
    );
  }

  factory ProductVariation.fromJson(Map<String, dynamic> json) =>
      _$ProductVariationFromJson(json);
  Map<String, dynamic> toJson() => _$ProductVariationToJson(this);
}

@JsonSerializable()
class Discount {
  String id;
  String name;
  double percent;
  List<String> productIds;

  Discount({
    this.id = "0",
    this.name = "",
    this.percent = 0.0,
    this.productIds = const [],
  });

  Discount copyWith({
    String? id,
    String? name,
    double? percent,
    List<String>? productIds,
  }) {
    return Discount(
      id: id ?? this.id,
      name: name ?? this.name,
      percent: percent ?? this.percent,
      productIds: productIds ?? this.productIds,
    );
  }

  factory Discount.fromJson(Map<String, dynamic> json) =>
      _$DiscountFromJson(json);

  Map<String, dynamic> toJson() => _$DiscountToJson(this);
}

@JsonSerializable()
class PaymentMode {
  String id;
  String name;
  double taxAmount;
  double taxPercent;

  PaymentMode({
    this.id = "0",
    this.name = "",
    this.taxAmount = 0.0,
    this.taxPercent = 0.0,
  });

  PaymentMode copyWith({
    String? id,
    String? name,
    double? taxAmount,
    double? taxPercent,
  }) {
    return PaymentMode(
      id: id ?? this.id,
      name: name ?? this.name,
      taxAmount: taxAmount ?? this.taxAmount,
      taxPercent: taxPercent ?? this.taxPercent,
    );
  }

  factory PaymentMode.fromJson(Map<String, dynamic> json) =>
      _$PaymentModeFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentModeToJson(this);
}

@JsonSerializable()
class Address {
  String address;
  String label;
  String landmark;
  bool isDefault;

  Address({
    this.address = "",
    this.label = "",
    this.landmark = "",
    this.isDefault = false,
  });

  Address copyWith({
    String? address,
    String? label,
    String? landmark,
    bool? isDefault,
  }) {
    return Address(
      address: address ?? this.address,
      label: label ?? this.label,
      landmark: landmark ?? this.landmark,
      isDefault: isDefault ?? this.isDefault,
    );
  }

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable()
class Customer {
  String id;
  String name;
  String phone;
  List<Address> addresses;

  Customer({
    this.id = "0",
    this.name = "",
    this.phone = "",
    this.addresses = const [],
  });

  Customer copyWith({
    String? id,
    String? name,
    String? phone,
    List<Address>? addresses,
  }) {
    return Customer(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      addresses: addresses ?? this.addresses,
    );
  }

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Order {
  String id;
  Customer customer;
  String customerName;
  String customerPhone;
  Address? customerAddress;
  String? instructions;
  List<Product> items;
  String status;
  double totalAmount;
  PaymentMode paymentMode;
  DateTime? orderTime;
  DateTime? deliveredTime;

  Order({
    this.id = "0",
    required this.customer,
    this.items = const [],
    this.totalAmount = 0.0,
    this.status = "pending",
    required this.paymentMode,
    this.orderTime,
    this.deliveredTime,
    this.customerName = "",
    this.customerPhone = "",
    this.customerAddress,
  });

  Order copyWith({
    String? id,
    String? customerId,
    Customer? customer,
    List<Product>? items,
    double? totalAmount,
    String? status,
    PaymentMode? paymentMode,
    DateTime? orderTime,
    DateTime? deliveredTime,
  }) {
    return Order(
      id: id ?? this.id,
      customer: customer ?? this.customer,
      items: items ?? this.items,
      totalAmount: totalAmount ?? this.totalAmount,
      status: status ?? this.status,
      paymentMode: paymentMode ?? this.paymentMode,
      orderTime: orderTime ?? this.orderTime,
      deliveredTime: deliveredTime ?? this.deliveredTime,
    );
  }

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

@JsonSerializable()
class Branch {
  String id;
  String name;
  String startTime;
  String closeTime;
  List<String> closeOnDay;
  String address;
  String phoneNumber;
  List<Area> areas;

  Branch({
    this.id = "0",
    this.name = "",
    this.startTime = "",
    this.closeTime = "",
    this.closeOnDay = const [],
    this.address = "",
    this.phoneNumber = "",
    this.areas = const [],
  });

  Branch copyWith({
    String? id,
    String? name,
    String? startTime,
    String? closeTime,
    List<String>? closeOnDay,
    String? address,
    String? phoneNumber,
    List<Area>? areas,
  }) {
    return Branch(
      id: id ?? this.id,
      name: name ?? this.name,
      startTime: startTime ?? this.startTime,
      closeTime: closeTime ?? this.closeTime,
      closeOnDay: closeOnDay ?? this.closeOnDay,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      areas: areas ?? this.areas,
    );
  }

  factory Branch.fromJson(Map<String, dynamic> json) => _$BranchFromJson(json);

  Map<String, dynamic> toJson() => _$BranchToJson(this);
}

@JsonSerializable()
class Area {
  String id;
  String name;
  Area({this.id = "0", this.name = ""});

  Area copyWith({String? id, String? name}) {
    return Area(id: id ?? this.id, name: name ?? this.name);
  }

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);
  Map<String, dynamic> toJson() => _$AreaToJson(this);
}

@JsonSerializable()
class Rider {
  String id;
  String name;
  String phone;
  String phone2;
  String cnic;
  @JsonKey(fromJson: stringToUint8, toJson: uint8ToString)
  Uint8List?  image; // image url or base64 string

  Rider({
    this.id = "0",
    this.name = "",
    this.phone = "",
    this.phone2 = "",
    this.cnic = "",
    this.image ,
  });

  Rider copyWith({
    String? id,
    String? name,
    String? phone,
    String? phone2,
    String? cnic,
    Uint8List? image,
  }) {
    return Rider(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      phone2: phone2 ?? this.phone2,
      cnic: cnic ?? this.cnic,
      image: image ?? this.image,
    );
  }

  factory Rider.fromJson(Map<String, dynamic> json) => _$RiderFromJson(json);
  Map<String, dynamic> toJson() => _$RiderToJson(this);
}

String? uint8ToString(Uint8List? list) =>
    list != null ? base64Encode(list) : null;

Uint8List? stringToUint8(String? listString) =>
    listString != null && listString.isNotEmpty
        ? base64Decode(listString)
        : null;
