import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
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
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>> getAllUsers({required UserEntity user}) async* {
    // TODO: implement getAllUsers
    throw UnimplementedError();
  }

  @override
  Future<void> getCreateCurrentUser({required UserEntity user}) async {
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentUId() async {
    try {
      return firebaseAuth.currentUser!.uid;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e as String);
    } catch (e) {
      throw Exception(e as String);
    }
  }

  @override
  Stream<List<UserEntity>> getSingleUser({required UserEntity user}) async* {
    throw UnimplementedError();
  }

  @override
  Future<void> getUpdateUser({required UserEntity user}) async {
    throw UnimplementedError();
  }

  @override
  Future<void> googleAuth() async {
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() async {
    try {
      return firebaseAuth.currentUser?.uid != null;
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e as String);
    } catch (e) {
      throw Exception(e as String);
    }
  }

  @override
  Future<void> signIn({required UserEntity user}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e as String);
    } catch (e) {
      throw Exception(e as String);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e as String);
    } catch (e) {
      throw Exception(e as String);
    }
  }

  @override
  Future<void> signUp({required UserEntity user}) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!,
        password: user.password!,
      );
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthException(code: e as String);
    } catch (e) {
      throw Exception(e as String);
    }
  }
}
