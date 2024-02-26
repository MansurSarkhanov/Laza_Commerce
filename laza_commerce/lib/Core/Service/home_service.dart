import 'package:laza_commerce/Core/Models/product_model.dart';
import 'package:laza_commerce/Product/Utility/Firebase/firebase_references.dart';

class HomeService {
  final _firebaseRef = FirebaseReference.products.ref;
  Future<List<ProductModel>?> fetchAllProducts() async {
    final response = await _firebaseRef.withConverter<ProductModel>(
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
}
