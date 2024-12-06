// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:managerestaurent/core/enums/enums_images.dart';
import 'package:meta/meta.dart';

part 'enums_state_state.dart';

class EnumsStateCubit extends Cubit<imageenums> {
  EnumsStateCubit() : super(imageenums.icecream);
  void changeNewsType(imageenums imageType) {
    emit(imageType);
  }
}
