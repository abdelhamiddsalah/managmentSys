part of 'enums_state_cubit.dart';

@immutable
sealed class EnumsStateState {}

final class EnumsStateInitial extends EnumsStateState {}

final class EnumsStateChoice extends EnumsStateState {
  final ImageEnums image;

  EnumsStateChoice({required this.image});
}
