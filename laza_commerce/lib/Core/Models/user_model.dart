import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  String? uid;
  String? email;
  String? password;
  String? image;
  String? username;

  UserModel({
    this.uid,
    this.email,
    this.password,
    this.image,
    this.username,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return _$UserModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$UserModelToJson(this);
  }
}
