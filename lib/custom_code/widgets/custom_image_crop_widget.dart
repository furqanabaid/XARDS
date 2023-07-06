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

import 'package:firebase_storage/firebase_storage.dart';
import 'package:xards/auth/base_auth_user_provider.dart';

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
    required this.cropingFor,
    this.bottomSheetDismiss,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String image;
  final String shape;
  final String pageName;
  final Future<dynamic> Function() cropedImage;
  final String? cropingFor;
  final Future<dynamic> Function()? bottomSheetDismiss;
  @override
  _CustomImageCropWidgetState createState() => _CustomImageCropWidgetState();
}

class _CustomImageCropWidgetState extends State<CustomImageCropWidget> {
  CustomImageCropController controller = CustomImageCropController();
  bool boo = false;
  late String imageToShow;
  late MemoryImage? image;
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
                    image = await controller.onCropImage();

                    FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
                    var snapshot = await _firebaseStorage
                        .ref("/users/${currentUser?.uid.toString()}/")
                        .putData(image!.bytes);

                    var downloadUrl = await snapshot.ref.getDownloadURL();

                    setState(() {
                      if (widget.cropingFor == "addEmployee") {
                        FFAppState().addEmployeeImage = downloadUrl;
                      } else if (widget.cropingFor == "updateEmployee") {
                        FFAppState().updateEmployeeImage = downloadUrl;
                      } else if (widget.cropingFor == "profileImage") {
                        FFAppState().profileImage = downloadUrl;
                      }
                    });
                    // Navigator.of(context).pop();
                    widget.bottomSheetDismiss!();
                  },
                )),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom),
      ],
    );
  }
}
