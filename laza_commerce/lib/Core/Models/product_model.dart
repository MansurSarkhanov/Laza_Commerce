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

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    category = json['category'];
    description = json['description'];
    price = json['price'];
    username = json['username'];
    usernameId = json['username_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['category'] = category;
    data['description'] = description;
    data['price'] = price;
    data['username'] = username;
    data['username_id'] = usernameId;
    return data;
  }
}
