import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laza_commerce/Core/Data/Repository/impl_home_repository.dart';
import 'package:laza_commerce/Core/Models/user_model.dart';

import '../../Models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final _homeRepository = ImplHomeRepository();

  Future<void> fetchAllProducts() async {
    emit(HomeProgress());
    final response = await _homeRepository.fetchAllProducts();
    final userInfo = await _homeRepository.getUserinfo();

    if (response.isSuccess() || userInfo.isSuccess()) {
      final products = response.tryGetSuccess();
      final user = userInfo.tryGetSuccess();

      emit(HomeSuccess(productList: products!, user: user!));
    } else if (response.isError()) {
      emit(HomeFailure());
    }
  }
}
