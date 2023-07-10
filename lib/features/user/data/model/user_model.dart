import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';

/// User Model
class UserModel extends UserEntity {
  /// User Model Constructor
  const UserModel({
    super.uname,
    super.email,
    super.uid,
    super.status,
    super.profileUrl,
  });

  /// SnapShot [Map] to [UserModel] conversion
  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    final snapshotMap = snapshot.data()! as Map<String, dynamic>;
    return UserModel(
      uname: snapshotMap['uname'] as String,
      email: snapshotMap['email'] as String,
      profileUrl: snapshotMap['profileUrl'] as String,
      status: snapshotMap['status'] as String,
      uid: snapshotMap['uid'] as String,
    );
  }

  /// [UserModel] to Document [Map] conversion
  Map<String, dynamic> toDocument() {
    return {
      'uname': uname,
      'email': email,
      'profileUrl': profileUrl,
      'status': status,
      'uid': uid
    };
  }
}
