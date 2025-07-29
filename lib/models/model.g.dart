// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: (json['id'] as num?)?.toInt() ?? 0,
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
  id: (json['id'] as num?)?.toInt() ?? 0,
  categoryId: (json['categoryId'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? "",
  price: (json['price'] as num?)?.toDouble() ?? 0.0,
  quantity: (json['quantity'] as num?)?.toInt() ?? 0,
  flavours:
      (json['flavours'] as List<dynamic>?)
          ?.map((e) => ProductFlavour.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  sizes:
      (json['sizes'] as List<dynamic>?)
          ?.map((e) => ProductSize.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  isDiscounted: json['isDiscounted'] as bool? ?? false,
  discountPercent: (json['discountPercent'] as num?)?.toDouble() ?? 0.0,
  discountAmount: (json['discountAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  'id': instance.id,
  'categoryId': instance.categoryId,
  'name': instance.name,
  'price': instance.price,
  'discountPercent': instance.discountPercent,
  'discountAmount': instance.discountAmount,
  'isDiscounted': instance.isDiscounted,
  'quantity': instance.quantity,
  'flavours': instance.flavours,
  'sizes': instance.sizes,
};

ProductSize _$ProductSizeFromJson(Map<String, dynamic> json) => ProductSize(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? "",
  extraAmount: (json['extraAmount'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$ProductSizeToJson(ProductSize instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'extraAmount': instance.extraAmount,
    };

ProductFlavour _$ProductFlavourFromJson(Map<String, dynamic> json) =>
    ProductFlavour(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? "",
      extraAmount: (json['extraAmount'] as num?)?.toDouble() ?? 0.0,
    );

Map<String, dynamic> _$ProductFlavourToJson(ProductFlavour instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'extraAmount': instance.extraAmount,
    };
