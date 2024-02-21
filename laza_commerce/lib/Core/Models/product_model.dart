import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  String? id;
  String? name;
  String? image;
  String? category;
  String? description;
  String? price;
  String? username;
  String? usernameId;

  ProductModel(
      {this.id, this.name, this.image, this.category, this.description, this.price, this.username, this.usernameId});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return _$ProductModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductModelToJson(this);
  }
}
