import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';
import 'package:kuraa/features/user/presentation/cubit/credential/cubit/auth_cubit.dart';

/// UserRemote Data Source
abstract class UserRemoteDataSource {
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

  /// Updated USer
  Future<void> getUpdateUser({required UserEntity user});

  /// Gets Current UniqueId
  Future<String> getCurrentUId();

  /// Get All User
  Stream<List<UserEntity>> getAllUsers({required UserEntity user});

  /// GetSingle User
  Stream<List<UserEntity>> getSingleUser({required UserEntity user});

  /// Auth State Change Stream
  Stream<User?> authStateChange();
}
