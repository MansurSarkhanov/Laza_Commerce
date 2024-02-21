// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      price: json['price'] as String?,
      username: json['username'] as String?,
      usernameId: json['usernameId'] as String?,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'category': instance.category,
      'description': instance.description,
      'price': instance.price,
      'username': instance.username,
      'usernameId': instance.usernameId,
    };
