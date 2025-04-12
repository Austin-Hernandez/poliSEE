import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CandidatesRecord extends FirestoreRecord {
  CandidatesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "CityTown" field.
  String? _cityTown;
  String get cityTown => _cityTown ?? '';
  bool hasCityTown() => _cityTown != null;

  // "County" field.
  String? _county;
  String get county => _county ?? '';
  bool hasCounty() => _county != null;

  // "District" field.
  String? _district;
  String get district => _district ?? '';
  bool hasDistrict() => _district != null;

  // "FirstName" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "MiddleInitial" field.
  String? _middleInitial;
  String get middleInitial => _middleInitial ?? '';
  bool hasMiddleInitial() => _middleInitial != null;

  // "LastName" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "Party" field.
  String? _party;
  String get party => _party ?? '';
  bool hasParty() => _party != null;

  // "Image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "PolicySum" field.
  String? _policySum;
  String get policySum => _policySum ?? '';
  bool hasPolicySum() => _policySum != null;

  // "Summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  void _initializeFields() {
    _cityTown = snapshotData['CityTown'] as String?;
    _county = snapshotData['County'] as String?;
    _district = snapshotData['District'] as String?;
    _firstName = snapshotData['FirstName'] as String?;
    _middleInitial = snapshotData['MiddleInitial'] as String?;
    _lastName = snapshotData['LastName'] as String?;
    _party = snapshotData['Party'] as String?;
    _image = snapshotData['Image'] as String?;
    _policySum = snapshotData['PolicySum'] as String?;
    _summary = snapshotData['Summary'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('candidates');

  static Stream<CandidatesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CandidatesRecord.fromSnapshot(s));

  static Future<CandidatesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CandidatesRecord.fromSnapshot(s));

  static CandidatesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CandidatesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CandidatesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CandidatesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CandidatesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CandidatesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCandidatesRecordData({
  String? cityTown,
  String? county,
  String? district,
  String? firstName,
  String? middleInitial,
  String? lastName,
  String? party,
  String? image,
  String? policySum,
  String? summary,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'CityTown': cityTown,
      'County': county,
      'District': district,
      'FirstName': firstName,
      'MiddleInitial': middleInitial,
      'LastName': lastName,
      'Party': party,
      'Image': image,
      'PolicySum': policySum,
      'Summary': summary,
    }.withoutNulls,
  );

  return firestoreData;
}

class CandidatesRecordDocumentEquality implements Equality<CandidatesRecord> {
  const CandidatesRecordDocumentEquality();

  @override
  bool equals(CandidatesRecord? e1, CandidatesRecord? e2) {
    return e1?.cityTown == e2?.cityTown &&
        e1?.county == e2?.county &&
        e1?.district == e2?.district &&
        e1?.firstName == e2?.firstName &&
        e1?.middleInitial == e2?.middleInitial &&
        e1?.lastName == e2?.lastName &&
        e1?.party == e2?.party &&
        e1?.image == e2?.image &&
        e1?.policySum == e2?.policySum &&
        e1?.summary == e2?.summary;
  }

  @override
  int hash(CandidatesRecord? e) => const ListEquality().hash([
        e?.cityTown,
        e?.county,
        e?.district,
        e?.firstName,
        e?.middleInitial,
        e?.lastName,
        e?.party,
        e?.image,
        e?.policySum,
        e?.summary
      ]);

  @override
  bool isValidKey(Object? o) => o is CandidatesRecord;
}
