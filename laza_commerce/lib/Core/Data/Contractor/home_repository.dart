import 'package:laza_commerce/Core/Models/product_model.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../Models/failure_model.dart';

abstract class IHomeRepository {
  Future<Result<List<ProductModel>, FailureModel>> fetchAllProducts();
}