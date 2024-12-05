part of 'enums_state_cubit.dart';

@immutable
sealed class EnumsStateState {}

final class EnumsStateInitial extends EnumsStateState {}
final class EnumsStatechoice extends EnumsStateState {
  final imageenums image;

  EnumsStatechoice({required this.image});
}