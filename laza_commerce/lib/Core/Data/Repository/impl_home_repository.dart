import 'package:laza_commerce/Core/Data/Contractor/home_repository.dart';
import 'package:laza_commerce/Core/Models/failure_model.dart';
import 'package:laza_commerce/Core/Models/product_model.dart';
import 'package:laza_commerce/Core/Models/user_model.dart';
import 'package:laza_commerce/Core/Service/home_service.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../DI/injection.dart';

class ImplHomeRepository implements IHomeRepository {
  final _homeService = DependencyInjection().getIt.get<HomeService>();

  @override
  Future<Result<List<ProductModel>, FailureModel>> fetchAllProducts() async {
    try {
      final result = await _homeService.fetchAllProducts();

      return Success(result!);
    } catch (e) {
      print(e);
      return Error(FailureModel(message: e.toString()));
    }
  }

  @override
  Future<Result<UserModel, FailureModel>> getUserinfo() async {
    try {
      final user = await _homeService.getUserInfo();
      return Success(user!);
    } catch (e) {
      return Error(FailureModel(message: e.toString()));
    }
  }
}
