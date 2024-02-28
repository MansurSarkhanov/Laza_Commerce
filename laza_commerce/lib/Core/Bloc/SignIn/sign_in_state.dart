part of 'sign_in_cubit.dart';

abstract class SignInState {}

final class SignInInitial extends SignInState {
  final int number;

  SignInInitial({required this.number});
}

final class SignInProgress extends SignInState {
  final bool? isProgress;

  SignInProgress({this.isProgress});
}

final class SignInSuccess extends SignInState {}

final class SignInFailure extends SignInState {
  final String? message;
  SignInFailure({this.message});
}
