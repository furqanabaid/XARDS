// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:vcard_maintained/vcard_maintained.dart';
import 'package:download/download.dart';

Future vCard(
  String? name,
  String? title,
  String? description,
  String? mobile,
  String? phone,
  String? email,
  String? fax,
  String? street,
  String? city,
  String? country,
  String? zip,
  String? website,
  String? whatsapp,
  String? linkedin,
  String? xing,
  String? facebook,
  String? tiktok,
  String? youtube,
  String? telegram,
) async {
  // Add your function code here!
  var vCard = VCard();
  vCard.firstName = name!;
  vCard.role = title!;
  vCard.note = description!;
  vCard.homePhone = mobile!;
  vCard.cellPhone = phone!;
  vCard.email = email!;
  vCard.workFax = fax!;
  vCard.workAddress.street = street!;
  vCard.workAddress.city = city!;
  vCard.workAddress.countryRegion = country!;
  vCard.workAddress.postalCode = zip!;
  vCard.url = website!;
  vCard.socialUrls!['whatsapp'] = whatsapp!;
  vCard.socialUrls!['linkedin'] = linkedin!;
  vCard.socialUrls!['xing'] = xing!;
  vCard.socialUrls!['facebook'] = facebook!;
  vCard.socialUrls!['tiktok'] = tiktok!;
  vCard.socialUrls!['youtube'] = youtube!;
  vCard.socialUrls!['telegram'] = telegram!;

  /// Get formatted vCard
  /// @return {String} Formatted vCard in VCF format
  String contents = vCard.getFormattedString();
  // data.toString().codeUnits
  final stream = Stream.fromIterable(contents.codeUnits);

  /// Save to file
  download(stream, 'contact.vcf');

  /// Get as formatted string
  print(vCard.getFormattedString());
}
