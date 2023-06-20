// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert' show utf8;
import 'package:download/download.dart';

Future downloadCollectionAsCSV(List<DocumentReference>? docs) async {
  docs = docs ?? [];

  String fileContent =
      "name, title, empEmail, description, mobile, phone, fax, street, zip, city, country, website, linkedin, xing, instagram, facebook, tiktok, youtube, whatsapp, telegram";

  for (var i = 0; i < docs.length; i++) {
    // Get the document referenced by the current document reference
    var documentSnapshot = await docs[i].get();
    // Access the name field of the retrieved document
    var name = documentSnapshot.get('name');
    var title = documentSnapshot.get('title');
    var empEmail = documentSnapshot.get('empEmail');
    var description = documentSnapshot.get('description');
    var mobile = documentSnapshot.get('mobile');
    var phone = documentSnapshot.get('phone');
    var fax = documentSnapshot.get('fax');
    var street = documentSnapshot.get('street');
    var zip = documentSnapshot.get('zip');
    var city = documentSnapshot.get('city');
    var country = documentSnapshot.get('country');
    var website = documentSnapshot.get('website');
    var linkedin = documentSnapshot.get('linkedin');
    var xing = documentSnapshot.get('xing');
    var instagram = documentSnapshot.get('instagram');
    var facebook = documentSnapshot.get('facebook');
    var tiktok = documentSnapshot.get('tiktok');
    var youtube = documentSnapshot.get('youtube');
    var whatsapp = documentSnapshot.get('whatsapp');
    var telegram = documentSnapshot.get('telegram');

    fileContent +=
        "\n$name, $title, $empEmail, $description, $mobile, $phone, $fax, $street, $zip, $city, $country, $website, $linkedin, $xing, $instagram, $facebook, $tiktok, $youtube, $whatsapp, $telegram";
  }

  final fileName = "XARDS_" + DateTime.now().toString() + ".csv";

  // Encode the string as a List<int> of UTF-8 bytes
  var bytes = utf8.encode(fileContent);

  final stream = Stream.fromIterable(bytes);
  return download(stream, fileName);
}
