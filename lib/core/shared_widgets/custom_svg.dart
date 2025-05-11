import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvg extends StatelessWidget {
  const CustomSvg(
      {super.key,
      required this.path,
      this.height,
      this.width,
      this.fit = BoxFit.contain,
      this.color});

  final String path;
  final double? height;
  final double? width;
  final BoxFit fit;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SvgPicture.asset(
      path,
      colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),
      height: height ?? size.height * 0.03,
      width: width ?? size.width * 0.03,
      fit: fit,
    );
  }
}
