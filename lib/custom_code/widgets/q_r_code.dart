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

import 'package:barcode_widget/barcode_widget.dart';

import 'index.dart'; // Imports other custom widgets

import 'package:screenshot/screenshot.dart';
import 'package:image_downloader_web/image_downloader_web.dart';

class QRCode extends StatefulWidget {
  const QRCode({
    Key? key,
    this.width,
    this.height,
    this.employeeLink,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? employeeLink;

  @override
  _QRCodeState createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  ScreenshotController screenShotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: screenShotController,
      child: Material(
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).accent3,
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                child: BarcodeWidget(
                  data:
                      'https://xards.flutterflow.app/employeeDetails?employeeRefeence=${FFAppState().selectedEmployee?.id}',
                  barcode: Barcode.qrCode(),
                  width: 100.0,
                  height: 50.0,
                  color: Colors.black,
                  backgroundColor: Colors.transparent,
                  errorBuilder: (_context, _error) => SizedBox(
                    width: 100.0,
                    height: 50.0,
                  ),
                  drawText: false,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            child: InkWell(
              onTap: () {
                var container = ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: 1000.0,
                    height: 1000.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).accent3,
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                      child: BarcodeWidget(
                        data:
                            'https://xards.flutterflow.app/employeeDetails?employeeRefeence=${FFAppState().selectedEmployee?.id}',
                        barcode: Barcode.qrCode(),
                        width: 100.0,
                        height: 50.0,
                        color: Colors.black,
                        backgroundColor: Colors.transparent,
                        errorBuilder: (_context, _error) => SizedBox(
                          width: 100.0,
                          height: 50.0,
                        ),
                        drawText: false,
                      ),
                    ),
                  ),
                );
                screenShotController
                    .captureFromWidget(
                        InheritedTheme.captureAll(
                            context, Material(child: container)),
                        delay: Duration(seconds: 1))
                    .then((capturedImage) {
                  ShowCapturedWidget(context, capturedImage);
                });
              },
              child: Container(
                width: 100,
                height: 30,
                color: FlutterFlowTheme.of(context).secondaryBackground,
                child: Align(
                  alignment: AlignmentDirectional.center,
                  child: Text("Download"),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

Future<dynamic> ShowCapturedWidget(
    BuildContext context, Uint8List capturedImage) async {
  await WebImageDownloader.downloadImageFromUInt8List(
      uInt8List: capturedImage, imageQuality: 1, imageType: ImageType.png);
}
