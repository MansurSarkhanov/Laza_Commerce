import 'package:laza_commerce/Core/Models/category_model.dart';
import 'package:laza_commerce/Core/Models/product_model.dart';
import 'package:laza_commerce/Core/Models/user_model.dart';
import 'package:laza_commerce/Product/Utility/Firebase/firebase_references.dart';

import '../DI/injection.dart';
import '../Data/Cache/cache_manager.dart';

class HomeService {
  final _firebaseRefProd = FirebaseReference.products.ref;
  final _firebaseRefUser = FirebaseReference.users.ref;
  final _firebaseRefCategory = FirebaseReference.categories.ref;

  final _cacheManager = DependencyInjection().getIt.get<CacheManager>();

  Future<List<ProductModel>?> fetchAllProducts() async {
    final response = await _firebaseRefProd.withConverter<ProductModel>(
      fromFirestore: (snapshot, options) {
        return ProductModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final products = response.docs.map((e) => e.data()).toList();
      print('sdfsdf');
      return products;
    }
    return null;
  }

  Future<UserModel?> getUserInfo() async {
    final token = await _cacheManager.readString(key: 'token');
    final response = _firebaseRefUser
        .doc(token)
        .withConverter(
          fromFirestore: (snapshot, options) {
            return UserModel.fromJson(snapshot.data()!);
          },
          toFirestore: (value, options) {
            return value.toJson();
          },
        )
        .get()
        .then((e) => e.data());
    return response;
  }

  Future<List<CategoryModel>?> fetchCategories() async {
    final response = await _firebaseRefCategory.withConverter(
      fromFirestore: (snapshot, options) {
        return CategoryModel.fromJson(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.toJson();
      },
    ).get();
    if (response.docs.isNotEmpty) {
      final categories = response.docs.map((e) => e.data()).toList();
      print('sdfsdf');
      return categories;
    }
    return null;
  }

  Future<void> sendProduct(ProductModel productModel) async {
    final model = ProductModel(
      category: productModel.category,
      description: productModel.description,
      expiration_date: productModel.expiration_date,
      id: productModel.id,
      image: productModel.image,
      name: productModel.name,
      price: productModel.price,
      start_date: productModel.start_date,
      username: productModel.username,
      usernameId: productModel.usernameId,
    ).toJson();
    final request = _firebaseRefProd.doc().set(model);
    print(request);
    return;
  }
}
