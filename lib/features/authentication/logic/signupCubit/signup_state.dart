// ignore_for_file: camel_case_types

part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}
class uploasProfilepic extends SignupState {}
class SignupSuccess extends SignupState {
  final User user;
  SignupSuccess({required this.user, required String name});
}

class SignupFailure extends SignupState {
  final String errorMessage;
  SignupFailure(this.errorMessage);
}
