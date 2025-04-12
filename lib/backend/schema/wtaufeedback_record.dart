import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WtaufeedbackRecord extends FirestoreRecord {
  WtaufeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "like" field.
  bool? _like;
  bool get like => _like ?? false;
  bool hasLike() => _like != null;

  // "dislike" field.
  bool? _dislike;
  bool get dislike => _dislike ?? false;
  bool hasDislike() => _dislike != null;

  // "candidateName" field.
  String? _candidateName;
  String get candidateName => _candidateName ?? '';
  bool hasCandidateName() => _candidateName != null;

  void _initializeFields() {
    _like = snapshotData['like'] as bool?;
    _dislike = snapshotData['dislike'] as bool?;
    _candidateName = snapshotData['candidateName'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('wtaufeedback');

  static Stream<WtaufeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WtaufeedbackRecord.fromSnapshot(s));

  static Future<WtaufeedbackRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WtaufeedbackRecord.fromSnapshot(s));

  static WtaufeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WtaufeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WtaufeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WtaufeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WtaufeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WtaufeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWtaufeedbackRecordData({
  bool? like,
  bool? dislike,
  String? candidateName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'like': like,
      'dislike': dislike,
      'candidateName': candidateName,
    }.withoutNulls,
  );

  return firestoreData;
}

class WtaufeedbackRecordDocumentEquality
    implements Equality<WtaufeedbackRecord> {
  const WtaufeedbackRecordDocumentEquality();

  @override
  bool equals(WtaufeedbackRecord? e1, WtaufeedbackRecord? e2) {
    return e1?.like == e2?.like &&
        e1?.dislike == e2?.dislike &&
        e1?.candidateName == e2?.candidateName;
  }

  @override
  int hash(WtaufeedbackRecord? e) =>
      const ListEquality().hash([e?.like, e?.dislike, e?.candidateName]);

  @override
  bool isValidKey(Object? o) => o is WtaufeedbackRecord;
}
