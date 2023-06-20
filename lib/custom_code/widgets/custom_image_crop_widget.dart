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
  }) : super(key: key);

  final double? width;
  final double? height;
  final String image;
  final String shape;
  final String pageName;

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
                color: Color(0xF212121),
                child: IconButton(
                  icon: const Icon(Icons.crop),
                  color: Color(0xFFf7f7f7),
                  onPressed: () async {
                    final image = await controller.onCropImage();
                    setState(() {
                      imageToShow = image.toString();
                      boo = true;
                      if (image != null) {
                        FFAppState().addEmployeeImage =
                            "data:image/png;base64,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";
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
