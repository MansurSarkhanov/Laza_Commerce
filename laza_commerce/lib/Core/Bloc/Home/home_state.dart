part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ProductModel>? productList;
  final List<CategoryModel>? categoryList;
  final String selectedCategory;
  final UserModel? user;
  final bool isLoading;


  const HomeSuccess({
    this.selectedCategory = '',
    this.categoryList,
    this.productList,
    this.user,
    this.isLoading = false,
  });
  HomeSuccess copyWith({categoryList, productList, user, selectedCategory, isLoading}) => HomeSuccess(
      isLoading: isLoading ?? this.isLoading,
      categoryList: categoryList ?? this.categoryList,
      productList: productList ?? this.productList,
      user: user ?? this.user,
      selectedCategory: selectedCategory ?? this.selectedCategory);   
}

final class HomeProgress extends HomeState {}


final class HomeFailure extends HomeState {}
