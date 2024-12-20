// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:managerestaurent/features/home/ui/widgets/rowOfImagesTitlesInHome.dart';

// الإشارة إلى ملف الجزء
part 'enums_state_state.dart';

class EnumsStateCubit extends Cubit<ImageEnums> {
  EnumsStateCubit() : super(ImageEnums.icecream);

  // تغيير النوع فقط إذا كان مختلفًا عن النوع الحالي
  void changeNewsType(ImageEnums imageType) {
    if (state != imageType) {
      emit(imageType);
    }
  }
}
