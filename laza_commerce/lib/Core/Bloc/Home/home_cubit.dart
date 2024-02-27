import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laza_commerce/Core/Data/Repository/impl_home_repository.dart';
import 'package:laza_commerce/Core/Models/category_model.dart';
import 'package:laza_commerce/Core/Models/user_model.dart';

import '../../Models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final _homeRepository = ImplHomeRepository();
  // String? _chosenModel = widget.state.categoryList.first.name;

  Future<void> fetchAllProducts() async {
    emit(HomeProgress());
    final response = await _homeRepository.fetchAllProducts();
    final userInfo = await _homeRepository.getUserinfo();
    final category = await _homeRepository.fetchAllCategories();

    if (response.isSuccess() || userInfo.isSuccess()) {
      final products = response.tryGetSuccess();
      final user = userInfo.tryGetSuccess();
      final categories = category.tryGetSuccess();

      emit(HomeSuccess(productList: products!, user: user!, categoryList: categories!));
    } else if (response.isError()) {
      emit(HomeFailure());
    }
  }
}
