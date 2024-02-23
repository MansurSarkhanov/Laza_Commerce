part of 'sign_in_cubit.dart';

abstract class SignInState {}

final class SignInInitial extends SignInState {}

final class SignInProgress extends SignInState {}

final class SignInSuccess extends SignInState {}

final class SignInFailure extends SignInState {
  final String? message;
  SignInFailure({this.message});
}
