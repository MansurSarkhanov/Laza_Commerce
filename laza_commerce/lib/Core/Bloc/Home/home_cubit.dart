import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:laza_commerce/Core/Data/Repository/impl_home_repository.dart';

import '../../Models/product_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final _homeRepository = ImplHomeRepository();

  Future<void> fetchAllProducts() async {
    emit(HomeProgress());
    final response = await _homeRepository.fetchAllProducts();
    if (response.isSuccess()) {
      final products = response.tryGetSuccess();
      emit(HomeSuccess(productList: products!));
    } else if (response.isError()) {
      emit(HomeFailure());
    }
  }
}
