// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:math';

import 'package:custom_image_crop/custom_image_crop.dart';

class CustomImageCropWidget extends StatefulWidget {
  const CustomImageCropWidget({
    Key? key,
    this.width,
    this.height,
    required this.image,
    required this.shape,
    required this.pageName,
    required this.cropedImage,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String image;
  final String shape;
  final String pageName;
  final Future<dynamic> Function() cropedImage;
  @override
  _CustomImageCropWidgetState createState() => _CustomImageCropWidgetState();
}

class _CustomImageCropWidgetState extends State<CustomImageCropWidget> {
  CustomImageCropController controller = CustomImageCropController();
  bool boo = false;
  late String imageToShow;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: CustomImageCrop(
            cropController: controller,
            // image: const AssetImage('assets/test.png'), // Any Imageprovider will work, try with a NetworkImage for example...
            image: NetworkImage(widget.image),
            shape: (widget.shape == "circle")
                ? CustomCropShape.Circle
                : CustomCropShape.Square,
            canRotate: true,
            canMove: false,
            canScale: false,
          ),
        ),
        (boo) ? Text("image set") : Text("no date"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                    icon: const Icon(Icons.refresh),
                    onPressed: controller.reset),
                IconButton(
                    icon: const Icon(Icons.zoom_in),
                    onPressed: () =>
                        controller.addTransition(CropImageData(scale: 1.33))),
                IconButton(
                    icon: const Icon(Icons.zoom_out),
                    onPressed: () =>
                        controller.addTransition(CropImageData(scale: 0.75))),
                IconButton(
                    icon: const Icon(Icons.rotate_left),
                    onPressed: () => controller
                        .addTransition(CropImageData(angle: -pi / 4))),
                IconButton(
                    icon: const Icon(Icons.rotate_right),
                    onPressed: () =>
                        controller.addTransition(CropImageData(angle: pi / 4))),
              ],
            ),
            Container(
                width: 50,
                height: 50,
                color: Color(0xFFFFFFFF),
                child: IconButton(
                  icon: const Icon(Icons.crop),
                  color: Color(0xFF000000),
                  onPressed: () async {
                    final image = await controller.onCropImage();
                    setState(() {
                      imageToShow = image.toString();
                      boo = true;
                      if (image != null) {
                        FFAppState().addEmployeeImage = imageToShow;
                        widget.cropedImage();
                      }
                    });
                  },
                )),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}
