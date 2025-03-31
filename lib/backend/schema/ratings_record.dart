import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RatingsRecord extends FirestoreRecord {
  RatingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nps_score" field.
  double? _npsScore;
  double get npsScore => _npsScore ?? 0.0;
  bool hasNpsScore() => _npsScore != null;

  // "customer_service" field.
  int? _customerService;
  int get customerService => _customerService ?? 0;
  bool hasCustomerService() => _customerService != null;

  void _initializeFields() {
    _npsScore = castToType<double>(snapshotData['nps_score']);
    _customerService = castToType<int>(snapshotData['customer_service']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ratings');

  static Stream<RatingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RatingsRecord.fromSnapshot(s));

  static Future<RatingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RatingsRecord.fromSnapshot(s));

  static RatingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RatingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RatingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RatingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RatingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RatingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRatingsRecordData({
  double? npsScore,
  int? customerService,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nps_score': npsScore,
      'customer_service': customerService,
    }.withoutNulls,
  );

  return firestoreData;
}

class RatingsRecordDocumentEquality implements Equality<RatingsRecord> {
  const RatingsRecordDocumentEquality();

  @override
  bool equals(RatingsRecord? e1, RatingsRecord? e2) {
    return e1?.npsScore == e2?.npsScore &&
        e1?.customerService == e2?.customerService;
  }

  @override
  int hash(RatingsRecord? e) =>
      const ListEquality().hash([e?.npsScore, e?.customerService]);

  @override
  bool isValidKey(Object? o) => o is RatingsRecord;
}
