import 'package:flutter/material.dart';
import 'package:flutter_nti_task/features/home/view/widgets/inprogress_category_containers_widget.dart';

class InprogressCategoryBuilder extends StatelessWidget {
  InprogressCategoryBuilder({super.key});

  List<Widget> inprogressCategory = [
    InProgressWorkContainerWidget(),
    InProgressHomeContainerWidget(),
    InProgressPersonalContainerWidget(),
    InProgressWorkContainerWidget(),
    InProgressHomeContainerWidget(),
    InProgressPersonalContainerWidget(),
    InProgressWorkContainerWidget(),
    InProgressHomeContainerWidget(),
    InProgressPersonalContainerWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.11,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => inprogressCategory[index],
        itemCount: inprogressCategory.length,
        separatorBuilder: (context, index) => SizedBox(
          width: size.width * 0.05,
        ),
      ),
    );
  }
}
