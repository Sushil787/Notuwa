import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:kuraa/features/user/data/model/user_model.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';
import 'package:kuraa/features/user/domain/repository/user_remote_data_source.dart';

/// User Data Source
@Injectable(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  /// User Remote DataSource Impl
  UserRemoteDataSourceImpl({
    required this.firebaseFirestore,
    required this.firebaseAuth,
    required this.googleSignIn,
  });

  //// Firebase Firestore Instance
  final FirebaseFirestore firebaseFirestore;
  //// Firebase Auth Instance
  final FirebaseAuth firebaseAuth;

  /// Google SignIn Instance
  final GoogleSignIn googleSignIn;

  @override
  Future<void> forgotPassword({required String email}) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Stream<List<UserEntity>> getAllUsers({required UserEntity user}) {
    try {
      final userCollection = firebaseFirestore.collection('users');
      return userCollection
          .where(
            'uid',
            isNotEqualTo: user.uid,
          )
          .snapshots()
          .map(
        (querySnapshot) {
          return querySnapshot.docs
              .map(
                UserModel.fromSnapshot,
              )
              .toList();
        },
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> getCreateCurrentUser({required UserEntity user}) async {
    try {
      final userCollection = firebaseFirestore.collection('users');
      final uid = await getCurrentUId();
      await userCollection.doc(uid).get().then((userDoc) {
        if (!userDoc.exists) {
          final newUser = UserModel(
            email: user.email,
            status: user.status,
            uid: uid,
            profileUrl: user.profileUrl,
            uname: user.uname,
          );
          userCollection.doc(uid).set(
                newUser.toDocument(),
              );
        } else {
          log('user already exists');
          return;
        }
      });
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<String> getCurrentUId() async {
    try {
      return firebaseAuth.currentUser!.uid;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Stream<List<UserEntity>> getSingleUser({required UserEntity user}) {
    try {
      final userCollection = firebaseFirestore.collection('users');
      return userCollection
          .limit(1)
          .where('uid', isEqualTo: user.uid)
          .snapshots()
          .map(
        (querySnapshot) {
          return querySnapshot.docs
              .map(
                UserModel.fromSnapshot,
              )
              .toList();
        },
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> getUpdateUser({required UserEntity user}) async {
    try {
      final userCollection = firebaseFirestore.collection('users');
      final userInfo = <String, dynamic>{};

      if (user.profileUrl != null && user.profileUrl != '') {
        userInfo['profileUrl'] = user.profileUrl;
      }
      if (user.status != null && user.status != '') {
        userInfo['status'] = user.status;
      }
      if (user.uname != null && user.uname != '') {
        userInfo['uname'] = user.uname;
      }
      await userCollection.doc(user.uid).update(userInfo);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> googleAuth() async {
    try {
      final account = await googleSignIn.signIn();
      final googleAuth = await account!.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final user =
          (await firebaseAuth.signInWithCredential(authCredential)).user;
      await getCreateCurrentUser(
        user: UserEntity(
          uname: user?.displayName ?? '',
          email: user!.email,
          profileUrl: user.photoURL,
        ),
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      log(e.toString());
      StackTrace.fromString(e.toString());

      throw Exception(e);
    }
  }

  @override
  Future<bool> isSignIn() async {
    try {
      return firebaseAuth.currentUser?.uid != null;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signIn({required UserEntity user}) async {
    try {
      await firebaseAuth
          .signInWithEmailAndPassword(
            email: user.email!,
            password: user.password!,
          )
          .then(
            (value) => getCreateCurrentUser(user: user),
          );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  @override
  Future<void> signUp({required UserEntity user}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
      await getCreateCurrentUser(user: user);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e.code);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
