part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ProductModel> productList;
  final List<CategoryModel> categoryList;
  final String selectedCategory;
  final UserModel user;

  const HomeSuccess({
    this.selectedCategory = '',
    required this.categoryList,
    required this.productList,
    required this.user,
  });
}

final class HomeProgress extends HomeState {}

final class HomeFailure extends HomeState {}

final class HomeProductTabSuccess extends HomeState {}

final class HomeProductTabProgress extends HomeState {}
