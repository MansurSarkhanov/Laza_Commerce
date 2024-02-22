part of 'sign_up_cubit.dart';

abstract class SignUpState {}

final class SignUpInitial extends SignUpState {
  final bool? isRemember;

  SignUpInitial({this.isRemember});
}

final class SignUpSuccess extends SignUpState {}

final class SignUpProgress extends SignUpState {}

final class SignUpFailure extends SignUpState {
  final String message;

  SignUpFailure({required this.message});
}
