import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nti_task/core/shared_widgets/image_manager/cubit/image_manager_cubit.dart';
import 'package:image_picker/image_picker.dart';
import 'cubit/image_manager_state.dart';

class ImageManagerView extends StatelessWidget {
  const ImageManagerView({
    super.key,
    required this.onPicked,
    this.pickedBody,
    this.unPickedBody,
  });

  final void Function(XFile image) onPicked;
  final Widget Function(XFile image)? pickedBody;
  final Widget? unPickedBody;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ImageManagerCubit(),
      child: BlocConsumer<ImageManagerCubit, ImageManagerState>(
        listener: (context, state) {
          if (state is ImageManagerPickedState) {
            onPicked(state.image);
          }
        },
        builder: (context, state) {
          return InkWell(
            onTap: ImageManagerCubit.get(context).pickImage,
            child: Builder(builder: (context) {
              if (state is ImageManagerPickedState) {
                if (pickedBody != null) return pickedBody!(state.image);
                return Container(
                  height: size.height * 0.3,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: FileImage(File(state.image.path)),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }
              if (unPickedBody != null) {
                return unPickedBody!;
              }
              return Icon(Icons.image);
            }),
          );
        },
      ),
    );
  }
}
