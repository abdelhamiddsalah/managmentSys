part of 'login_cubit.dart';  // إضافة هذا السطر لربط الكود مع LoginCubit

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  final User user;

  LoginSuccess({required this.user});
}

final class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});
}

final class LoginPasswordResetSuccess extends LoginState {}
