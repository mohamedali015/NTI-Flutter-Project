import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/features/profile/manager/setting_cubit/setting_cubit.dart';
import 'package:flutter_nti_task/features/profile/manager/setting_cubit/setting_state.dart';
import 'package:flutter_nti_task/features/profile/view/widgets/setting_widgets.dart';

import '../../../core/shared_widgets/app_svg_icon.dart';
import '../../../core/translations/app_strings.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_color.dart';

class SettingScreen extends StatelessWidget {
  static const String routeName = "SettingScreen";

  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: AppSvgIcon(imagePath: AppAssets.backArrow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppStrings.settings,
        ),
        centerTitle: true,
        toolbarHeight: size.height * 0.085,
      ),
      body: BlocProvider(
        create: (context) => SettingCubit(),
        child: Builder(builder: (context) {
          SettingCubit settingCubit = SettingCubit.get(context);
          return Padding(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07, vertical: size.height * 0.05),
            child: BlocBuilder<SettingCubit, SettingState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          AppStrings.language,
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: settingCubit.changeLanguageOnPressed,
                          child: Row(
                            children: [
                              SettingWidgets(
                                text: AppStrings.en,
                                selected: !settingCubit.selected,
                                borderLeft: true,
                              ),
                              SettingWidgets(
                                text: AppStrings.ar,
                                selected: settingCubit.selected,
                                borderLeft: false,
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          );
        }),
      ),
    );
  }
}

