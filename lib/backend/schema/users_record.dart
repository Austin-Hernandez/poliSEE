import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "login_count" field.
  int? _loginCount;
  int get loginCount => _loginCount ?? 0;
  bool hasLoginCount() => _loginCount != null;

  // "is_admin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  bool hasIsAdmin() => _isAdmin != null;

  // "fav_can2" field.
  List<DocumentReference>? _favCan2;
  List<DocumentReference> get favCan2 => _favCan2 ?? const [];
  bool hasFavCan2() => _favCan2 != null;

  // "fav_can_name2" field.
  List<String>? _favCanName2;
  List<String> get favCanName2 => _favCanName2 ?? const [];
  bool hasFavCanName2() => _favCanName2 != null;

  // "fav_can_lastname" field.
  List<String>? _favCanLastname;
  List<String> get favCanLastname => _favCanLastname ?? const [];
  bool hasFavCanLastname() => _favCanLastname != null;

  // "fav_can_image" field.
  List<String>? _favCanImage;
  List<String> get favCanImage => _favCanImage ?? const [];
  bool hasFavCanImage() => _favCanImage != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _loginCount = castToType<int>(snapshotData['login_count']);
    _isAdmin = snapshotData['is_admin'] as bool?;
    _favCan2 = getDataList(snapshotData['fav_can2']);
    _favCanName2 = getDataList(snapshotData['fav_can_name2']);
    _favCanLastname = getDataList(snapshotData['fav_can_lastname']);
    _favCanImage = getDataList(snapshotData['fav_can_image']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? loginCount,
  bool? isAdmin,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'login_count': loginCount,
      'is_admin': isAdmin,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.loginCount == e2?.loginCount &&
        e1?.isAdmin == e2?.isAdmin &&
        listEquality.equals(e1?.favCan2, e2?.favCan2) &&
        listEquality.equals(e1?.favCanName2, e2?.favCanName2) &&
        listEquality.equals(e1?.favCanLastname, e2?.favCanLastname) &&
        listEquality.equals(e1?.favCanImage, e2?.favCanImage);
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.loginCount,
        e?.isAdmin,
        e?.favCan2,
        e?.favCanName2,
        e?.favCanLastname,
        e?.favCanImage
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
