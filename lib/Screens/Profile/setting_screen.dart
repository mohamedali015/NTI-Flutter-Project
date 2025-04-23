import 'package:flutter/material.dart';
import 'package:flutter_nti_task/Widgets/app_svg.dart';
import 'package:flutter_nti_task/Widgets/setting_widgets.dart';
import 'package:flutter_nti_task/utils/app_assets.dart';
import 'package:flutter_nti_task/utils/app_color.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "SettingScreen";

  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  late bool selected = false;

  bool borderLeft = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: AppSvg(imagePath: AppAssets.backArrow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Settings"),
        centerTitle: true,
        toolbarHeight: size.height * 0.085,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.07, vertical: size.height * 0.05),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Language",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Row(
                    children: [
                      SettingWidgets(
                        text: "EN",
                        selected: !selected,
                        borderLeft: !borderLeft,
                      ),
                      SettingWidgets(
                        text: "AR",
                        selected: selected,
                        borderLeft: borderLeft,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
