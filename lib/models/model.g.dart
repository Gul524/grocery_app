// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: json['id'] as String? ?? "0",
  name: json['name'] as String? ?? "",
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'products': instance.products,
};

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: json['id'] as String? ?? "0",
  imageBytes: stringToUint8(json['imageBytes'] as String?),
  categoryId: (json['categoryId'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? "",
  description: json['description'] as String? ?? "",
  price: (json['price'] as num?)?.toInt() ?? 0,
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  variations:
      (json['variations'] as List<dynamic>?)
          ?.map((e) => ProductVariation.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isDiscounted: json['isDiscounted'] as bool? ?? false,
  discountPercent: (json['discountPercent'] as num?)?.toInt() ?? 0,
  discountAmount: (json['discountAmount'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'imageBytes': uint8ToString(instance.imageBytes),
  'categoryId': instance.categoryId,
  'name': instance.name,
  'description': instance.description,
  'price': instance.price,
  'discountPercent': instance.discountPercent,
  'discountAmount': instance.discountAmount,
  'isDiscounted': instance.isDiscounted,
  'quantity': instance.quantity,
  'variations': instance.variations,
};

ProductVariation _$ProductVariationFromJson(Map<String, dynamic> json) =>
    ProductVariation(
      name: json['name'] as String? ?? "",
      extraAmount: (json['extraAmount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$ProductVariationToJson(ProductVariation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'extraAmount': instance.extraAmount,
    };

Discount _$DiscountFromJson(Map<String, dynamic> json) => Discount(
  id: json['id'] as String? ?? "0",
  name: json['name'] as String? ?? "",
  percent: (json['percent'] as num?)?.toDouble() ?? 0.0,
  productIds:
      (json['productIds'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$DiscountToJson(Discount instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'percent': instance.percent,
  'productIds': instance.productIds,
};

PaymentMode _$PaymentModeFromJson(Map<String, dynamic> json) => PaymentMode(
  id: json['id'] as String? ?? "0",
  name: json['name'] as String? ?? "",
  taxAmount: (json['taxAmount'] as num?)?.toDouble() ?? 0.0,
  taxPercent: (json['taxPercent'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$PaymentModeToJson(PaymentMode instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'taxAmount': instance.taxAmount,
      'taxPercent': instance.taxPercent,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
  address: json['address'] as String? ?? "",
  label: json['label'] as String? ?? "",
  landmark: json['landmark'] as String? ?? "",
  isDefault: json['isDefault'] as bool? ?? false,
);

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
  'address': instance.address,
  'label': instance.label,
  'landmark': instance.landmark,
  'isDefault': instance.isDefault,
};

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
  id: json['id'] as String? ?? "0",
  name: json['name'] as String? ?? "",
  phone: json['phone'] as String? ?? "",
  addresses:
      (json['addresses'] as List<dynamic>?)
          ?.map((e) => Address.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'addresses': instance.addresses,
};

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['id'] as String? ?? "0",
  customerId: json['customerId'] as String? ?? "",
  customer: Customer.fromJson(json['customer'] as Map<String, dynamic>),
  items:
      (json['items'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
  status: json['status'] as String? ?? "pending",
  paymentMode: PaymentMode.fromJson(
    json['paymentMode'] as Map<String, dynamic>,
  ),
  orderTime:
      json['orderTime'] == null
          ? null
          : DateTime.parse(json['orderTime'] as String),
  deliveredTime:
      json['deliveredTime'] == null
          ? null
          : DateTime.parse(json['deliveredTime'] as String),
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'customerId': instance.customerId,
  'customer': instance.customer.toJson(),
  'items': instance.items.map((e) => e.toJson()).toList(),
  'status': instance.status,
  'totalAmount': instance.totalAmount,
  'paymentMode': instance.paymentMode.toJson(),
  'orderTime': instance.orderTime?.toIso8601String(),
  'deliveredTime': instance.deliveredTime?.toIso8601String(),
};

Branch _$BranchFromJson(Map<String, dynamic> json) => Branch(
  id: json['id'] as String? ?? "0",
  name: json['name'] as String? ?? "",
  startTime: json['startTime'] as String? ?? "",
  closeTime: json['closeTime'] as String? ?? "",
  closeOnDay:
      (json['closeOnDay'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  address: json['address'] as String? ?? "",
  phoneNumber: json['phoneNumber'] as String? ?? "",
);

Map<String, dynamic> _$BranchToJson(Branch instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'startTime': instance.startTime,
  'closeTime': instance.closeTime,
  'closeOnDay': instance.closeOnDay,
  'address': instance.address,
  'phoneNumber': instance.phoneNumber,
};
