import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../localization/localization_service.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(context) => BlocProvider.of(context);

  void chooseLang(String lang) {
    LocalizationService().changeLocale(lang);
    print('Choose Successful');
  }
}
