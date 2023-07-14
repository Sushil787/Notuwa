import 'package:firebase_auth/firebase_auth.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';

/// UserRepository interface class
abstract class UserRepository {
  /// Google Auth
  Future<void> googleAuth();

  /// Create User
  Future<void> getCreateCurrentUser({required UserEntity user});

  ///Forgot Password
  Future<void> forgotPassword({required String email});

  /// return [bool] isSignIn
  Future<bool> isSignIn();

  /// SignIn User
  Future<void> signIn({required UserEntity user});

  /// Signup User
  Future<void> signUp({required UserEntity user});

  /// SignOut User
  Future<void> signOut();

  /// Auth State Change Stream
  Stream<User?> authStateChange();

  /// Updated USer
  Future<void> getUpdateUser({required UserEntity user});

  /// Gets Current UniqueId
  Future<String> getCurrentUId();

  /// Get All User
  Stream<List<UserEntity>> getAllUsers({required UserEntity user});

  /// Get Single User
  Stream<List<UserEntity>> getSingleUser({required UserEntity user});
}
