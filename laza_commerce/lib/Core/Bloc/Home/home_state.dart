part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {
  final List<ProductModel> productList;

  const HomeSuccess({required this.productList});
}

final class HomeProgress extends HomeState {}

final class HomeFailure extends HomeState {}
