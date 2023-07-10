import 'package:injectable/injectable.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';
import 'package:kuraa/features/user/domain/repository/user_remote_data_source.dart';
import 'package:kuraa/features/user/domain/repository/user_repository.dart';

@Injectable(as: UserRepository)

/// [UserRepository] Implementation Class
class UserRepositoryImpl implements UserRepository {
  /// User RepoImpl Constructor
  UserRepositoryImpl({required this.userRemoteDataSource});

  /// UserRemoteDataSource Instance
  final UserRemoteDataSource userRemoteDataSource;

  @override
  Future<void> forgotPassword({required String email}) {
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>> getAllUsers({required UserEntity user}) {
    throw UnimplementedError();
  }

  @override
  Future<void> getCreateCurrentUser({required UserEntity user}) {
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentUId() {
    throw UnimplementedError();
  }

  @override
  Stream<List<UserEntity>> getSingleUser({required UserEntity user}) {
    throw UnimplementedError();
  }

  @override
  Future<void> getUpdateUser({required UserEntity user}) {
    throw UnimplementedError();
  }

  @override
  Future<void> googleAuth() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() {
    throw UnimplementedError();
  }

  @override
  Future<void> signIn({required UserEntity user}) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUp({required UserEntity user}) {
    throw UnimplementedError();
  }
}
