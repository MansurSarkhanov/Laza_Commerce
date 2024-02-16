class UserModel {
  String? uid;
  String? email;
  String? password;
  // String? image;
  String? username;

  UserModel({
    this.uid,
    this.email,
    this.password,
    // this.image,
    this.username,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    email = json['email'];
    password = json['password'];
    // image = json['image'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['email'] = email;
    data['password'] = password;
    // data['image'] = image;
    data['username'] = username;
    return data;
  }
}
