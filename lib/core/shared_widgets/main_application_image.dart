import 'package:flutter/material.dart';

class MainApplicationImage extends StatelessWidget {
  final Image? image;
  final double? width;
  final double? height;
  final String? imagePath;

  const MainApplicationImage({super.key, this.image, this.width, this.height,
    this.imagePath,
  });

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
        child: image ??
            Image.asset(
              imagePath!,
              // width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
