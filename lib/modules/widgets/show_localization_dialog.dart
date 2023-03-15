import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:traveller/shared/componants/componants.dart';
import 'package:traveller/shared/style/colors.dart';

import '../../shared/main_cubit/main_cubit.dart';

class ShowLocalizationBottomSheet extends StatefulWidget {
  const ShowLocalizationBottomSheet({Key? key, required this.isSplash})
      : super(key: key);
  final bool isSplash;

  @override
  State<ShowLocalizationBottomSheet> createState() =>
      _ShowLocalizationBottomSheetState();
}

class _ShowLocalizationBottomSheetState
    extends State<ShowLocalizationBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainCubit, MainState>(
      listener: (context, state) {
        if (state is LoadingChooseLangState) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
      builder: (context, state) {
        return state is LoadingChooseLangState
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  color: MainCubit.get(context).isDarke
                      ? Colors.white
                      : itemsColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: SizedBox(
                    // height: 180.h,
                    // width: 100.w,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Text(
                          'chose_lang'.tr,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        customButtom(
                          buttomColor: primaryColor,
                          text: 'عربي',
                          press: () {
                            MainCubit.get(context).chooseLang('Arabic');
                            Navigator.of(context).pop();
                            // Navigator.of(context)
                            //     .pushReplacementNamed(splashScreen);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        customButtom(
                          buttomColor: primaryColor,
                          text: 'English',
                          press: () {
                            MainCubit.get(context).chooseLang('English');
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}

Future<void> showLocalizationBottomSheet(context,
    {required bool isSplash}) async {
  await Get.bottomSheet(
    ShowLocalizationBottomSheet(
      isSplash: isSplash,
    ),
    enableDrag: true,
  );
}
