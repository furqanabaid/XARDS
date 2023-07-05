import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EmployeeRecord extends FirestoreRecord {
  EmployeeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "employeeOfFirm" field.
  DocumentReference? _employeeOfFirm;
  DocumentReference? get employeeOfFirm => _employeeOfFirm;
  bool hasEmployeeOfFirm() => _employeeOfFirm != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "fax" field.
  String? _fax;
  String get fax => _fax ?? '';
  bool hasFax() => _fax != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "zip" field.
  int? _zip;
  int get zip => _zip ?? 0;
  bool hasZip() => _zip != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "website" field.
  String? _website;
  String get website => _website ?? '';
  bool hasWebsite() => _website != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  bool hasLinkedin() => _linkedin != null;

  // "xing" field.
  String? _xing;
  String get xing => _xing ?? '';
  bool hasXing() => _xing != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  bool hasFacebook() => _facebook != null;

  // "tiktok" field.
  String? _tiktok;
  String get tiktok => _tiktok ?? '';
  bool hasTiktok() => _tiktok != null;

  // "youtube" field.
  String? _youtube;
  String get youtube => _youtube ?? '';
  bool hasYoutube() => _youtube != null;

  // "whatsapp" field.
  String? _whatsapp;
  String get whatsapp => _whatsapp ?? '';
  bool hasWhatsapp() => _whatsapp != null;

  // "telegram" field.
  String? _telegram;
  String get telegram => _telegram ?? '';
  bool hasTelegram() => _telegram != null;

  // "profileImage" field.
  String? _profileImage;
  String get profileImage => _profileImage ?? '';
  bool hasProfileImage() => _profileImage != null;

  // "empEmail" field.
  String? _empEmail;
  String get empEmail => _empEmail ?? '';
  bool hasEmpEmail() => _empEmail != null;

  // "backgroundColor" field.
  Color? _backgroundColor;
  Color? get backgroundColor => _backgroundColor;
  bool hasBackgroundColor() => _backgroundColor != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "pageLink" field.
  String? _pageLink;
  String get pageLink => _pageLink ?? '';
  bool hasPageLink() => _pageLink != null;

  // "isCircle" field.
  bool? _isCircle;
  bool get isCircle => _isCircle ?? false;
  bool hasIsCircle() => _isCircle != null;

  // "shapeIndex" field.
  int? _shapeIndex;
  int get shapeIndex => _shapeIndex ?? 0;
  bool hasShapeIndex() => _shapeIndex != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _employeeOfFirm = snapshotData['employeeOfFirm'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _phone = snapshotData['phone'] as String?;
    _fax = snapshotData['fax'] as String?;
    _street = snapshotData['street'] as String?;
    _zip = castToType<int>(snapshotData['zip']);
    _city = snapshotData['city'] as String?;
    _country = snapshotData['country'] as String?;
    _website = snapshotData['website'] as String?;
    _linkedin = snapshotData['linkedin'] as String?;
    _xing = snapshotData['xing'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _facebook = snapshotData['facebook'] as String?;
    _tiktok = snapshotData['tiktok'] as String?;
    _youtube = snapshotData['youtube'] as String?;
    _whatsapp = snapshotData['whatsapp'] as String?;
    _telegram = snapshotData['telegram'] as String?;
    _profileImage = snapshotData['profileImage'] as String?;
    _empEmail = snapshotData['empEmail'] as String?;
    _backgroundColor = getSchemaColor(snapshotData['backgroundColor']);
    _logo = snapshotData['logo'] as String?;
    _pageLink = snapshotData['pageLink'] as String?;
    _isCircle = snapshotData['isCircle'] as bool?;
    _shapeIndex = castToType<int>(snapshotData['shapeIndex']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('employee');

  static Stream<EmployeeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => EmployeeRecord.fromSnapshot(s));

  static Future<EmployeeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => EmployeeRecord.fromSnapshot(s));

  static EmployeeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      EmployeeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static EmployeeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      EmployeeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'EmployeeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is EmployeeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createEmployeeRecordData({
  String? name,
  DocumentReference? employeeOfFirm,
  String? title,
  String? description,
  String? mobile,
  String? phone,
  String? fax,
  String? street,
  int? zip,
  String? city,
  String? country,
  String? website,
  String? linkedin,
  String? xing,
  String? instagram,
  String? facebook,
  String? tiktok,
  String? youtube,
  String? whatsapp,
  String? telegram,
  String? profileImage,
  String? empEmail,
  Color? backgroundColor,
  String? logo,
  String? pageLink,
  bool? isCircle,
  int? shapeIndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'employeeOfFirm': employeeOfFirm,
      'title': title,
      'description': description,
      'mobile': mobile,
      'phone': phone,
      'fax': fax,
      'street': street,
      'zip': zip,
      'city': city,
      'country': country,
      'website': website,
      'linkedin': linkedin,
      'xing': xing,
      'instagram': instagram,
      'facebook': facebook,
      'tiktok': tiktok,
      'youtube': youtube,
      'whatsapp': whatsapp,
      'telegram': telegram,
      'profileImage': profileImage,
      'empEmail': empEmail,
      'backgroundColor': backgroundColor,
      'logo': logo,
      'pageLink': pageLink,
      'isCircle': isCircle,
      'shapeIndex': shapeIndex,
    }.withoutNulls,
  );

  return firestoreData;
}

class EmployeeRecordDocumentEquality implements Equality<EmployeeRecord> {
  const EmployeeRecordDocumentEquality();

  @override
  bool equals(EmployeeRecord? e1, EmployeeRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.employeeOfFirm == e2?.employeeOfFirm &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.mobile == e2?.mobile &&
        e1?.phone == e2?.phone &&
        e1?.fax == e2?.fax &&
        e1?.street == e2?.street &&
        e1?.zip == e2?.zip &&
        e1?.city == e2?.city &&
        e1?.country == e2?.country &&
        e1?.website == e2?.website &&
        e1?.linkedin == e2?.linkedin &&
        e1?.xing == e2?.xing &&
        e1?.instagram == e2?.instagram &&
        e1?.facebook == e2?.facebook &&
        e1?.tiktok == e2?.tiktok &&
        e1?.youtube == e2?.youtube &&
        e1?.whatsapp == e2?.whatsapp &&
        e1?.telegram == e2?.telegram &&
        e1?.profileImage == e2?.profileImage &&
        e1?.empEmail == e2?.empEmail &&
        e1?.backgroundColor == e2?.backgroundColor &&
        e1?.logo == e2?.logo &&
        e1?.pageLink == e2?.pageLink &&
        e1?.isCircle == e2?.isCircle &&
        e1?.shapeIndex == e2?.shapeIndex;
  }

  @override
  int hash(EmployeeRecord? e) => const ListEquality().hash([
        e?.name,
        e?.employeeOfFirm,
        e?.title,
        e?.description,
        e?.mobile,
        e?.phone,
        e?.fax,
        e?.street,
        e?.zip,
        e?.city,
        e?.country,
        e?.website,
        e?.linkedin,
        e?.xing,
        e?.instagram,
        e?.facebook,
        e?.tiktok,
        e?.youtube,
        e?.whatsapp,
        e?.telegram,
        e?.profileImage,
        e?.empEmail,
        e?.backgroundColor,
        e?.logo,
        e?.pageLink,
        e?.isCircle,
        e?.shapeIndex
      ]);

  @override
  bool isValidKey(Object? o) => o is EmployeeRecord;
}
