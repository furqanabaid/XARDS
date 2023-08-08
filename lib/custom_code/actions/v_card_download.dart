// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io' if (dart.library.html) 'dart:typed_data';
import 'dart:convert' show utf8, base64;
import 'package:path_provider/path_provider.dart';
import 'dart:html' as html;

class VCardData {
  String name;
  String phoneNumber;
  String email;

  VCardData(
      {required this.name, required this.phoneNumber, required this.email});
}

Future<void> downloadVCard(VCardData vCardData) async {
  // Create the .vcf content
  String vCardContent = '''
BEGIN:VCARD
VERSION:3.0
FN:${vCardData.name}
TEL:${vCardData.phoneNumber}
EMAIL:${vCardData.email}
END:VCARD
''';

  var dart;
  if (dart.library.html) {
    // For web platforms, trigger download using HTML5 download anchor
    final bytes = utf8.encode(vCardContent);
    final blob = html.Blob([Uint8List.fromList(bytes)]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "contact.vcf")
      ..click();
    html.Url.revokeObjectUrl(url);
  } else {
    // For mobile platforms, get the app's local directory path
    final appDocDir = await getApplicationDocumentsDirectory();
    final vCardFile = File('${appDocDir.path}/contact.vcf');
    await vCardFile.writeAsString(vCardContent);
  }
}

Future vCardDownload() async {
  // Add your function code here!
  VCardData vCardData = VCardData(
    name: 'John Doe',
    phoneNumber: '1234567890',
    email: 'john.doe@example.com',
  );

  // Call the function to download the .vcf file
  downloadVCard(vCardData);
}
