import 'package:flutter/material.dart';
import '../../../../core/utils/app_color.dart';

class StateContainerTemp extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color textColor;

  const StateContainerTemp({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.2,
      height: size.height * 0.03,
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.005,
        vertical: size.height * 0.005,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 10,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

enum Status { inProgress, done, missed }

class StateContainer extends StatelessWidget {
  final Status status;

  const StateContainer({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case Status.inProgress:
        return StateContainerTemp(
          title: "In Progress",
          backgroundColor: AppColors.sky,
          textColor: AppColors.black,
        );
      case Status.done:
        return StateContainerTemp(
          title: "Done",
          backgroundColor: AppColors.primary,
          textColor: AppColors.white,
        );
      case Status.missed:
        return StateContainerTemp(
          title: "Missed",
          backgroundColor: Colors.red,
          textColor: Colors.white,
        );
    }
  }
}
