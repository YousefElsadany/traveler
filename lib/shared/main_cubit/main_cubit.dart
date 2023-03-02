import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:traveller/shared/local_storage_service.dart';

import '../localization/localization_service.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  void chooseLang(String lang) {
    LocalizationService().changeLocale(lang);
    print('Choose Successful');
  }

  bool isDarke = false;

  void changeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDarke = fromShared;
      emit(AppChangeMode());
    } else {
      isDarke = !isDarke;
      LocalStorageService.putBool(key: 'isDark', value: isDarke).then((value) {
        emit(AppChangeMode());
      }).catchError((error) {
        print('ERROR******* ${error.toString()}');
      });
    }
  }
}
