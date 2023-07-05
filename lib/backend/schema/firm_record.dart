import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FirmRecord extends FirestoreRecord {
  FirmRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "firmName" field.
  String? _firmName;
  String get firmName => _firmName ?? '';
  bool hasFirmName() => _firmName != null;

  // "firmLogo" field.
  String? _firmLogo;
  String get firmLogo => _firmLogo ?? '';
  bool hasFirmLogo() => _firmLogo != null;

  // "uId" field.
  DocumentReference? _uId;
  DocumentReference? get uId => _uId;
  bool hasUId() => _uId != null;

  void _initializeFields() {
    _firmName = snapshotData['firmName'] as String?;
    _firmLogo = snapshotData['firmLogo'] as String?;
    _uId = snapshotData['uId'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('firm');

  static Stream<FirmRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FirmRecord.fromSnapshot(s));

  static Future<FirmRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FirmRecord.fromSnapshot(s));

  static FirmRecord fromSnapshot(DocumentSnapshot snapshot) => FirmRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FirmRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FirmRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FirmRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FirmRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFirmRecordData({
  String? firmName,
  String? firmLogo,
  DocumentReference? uId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'firmName': firmName,
      'firmLogo': firmLogo,
      'uId': uId,
    }.withoutNulls,
  );

  return firestoreData;
}

class FirmRecordDocumentEquality implements Equality<FirmRecord> {
  const FirmRecordDocumentEquality();

  @override
  bool equals(FirmRecord? e1, FirmRecord? e2) {
    return e1?.firmName == e2?.firmName &&
        e1?.firmLogo == e2?.firmLogo &&
        e1?.uId == e2?.uId;
  }

  @override
  int hash(FirmRecord? e) =>
      const ListEquality().hash([e?.firmName, e?.firmLogo, e?.uId]);

  @override
  bool isValidKey(Object? o) => o is FirmRecord;
}
