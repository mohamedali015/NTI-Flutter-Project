import 'package:flutter/material.dart';

class MainApplicationImage extends StatelessWidget {
  final String imagePath;

  final double? width;

  final double? height;

  const MainApplicationImage(
      {super.key, required this.imagePath, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: width ?? double.infinity,
      height: height ?? size.height * 0.3,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        child: Image.asset(
          imagePath,
          // width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
