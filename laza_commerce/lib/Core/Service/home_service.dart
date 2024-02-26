import 'package:laza_commerce/Core/Models/product_model.dart';
import 'package:laza_commerce/Core/Models/user_model.dart';
import 'package:laza_commerce/Product/Utility/Firebase/firebase_references.dart';

import '../DI/injection.dart';
import '../Data/Cache/cache_manager.dart';

class HomeService {
  final _firebaseRefProd = FirebaseReference.products.ref;
  final _firebaseRefUser = FirebaseReference.users.ref;
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
}
