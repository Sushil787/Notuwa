import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kuraa/core/helper/network_info.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';
import 'package:kuraa/features/user/domain/repository/user_repository.dart';
part 'auth_state.dart';

@singleton

/// Auth Cubit
class AuthCubit extends Cubit<AuthState> {
  /// Auth Cubit
  AuthCubit({
    required this.userRepository,
    required this.networkInfo,
  }) : super(AuthInitial());

  /// User Repository
  final UserRepository userRepository;

  /// Network Info
  final NetworkInfo networkInfo;

  /// Forgot password
  Future<void> forgotPassword({required String email}) async {
    try {
      await userRepository.forgotPassword(email: email);
    } on FirebaseException catch (_) {
      emit(AuthFailure(message: _.code));
    } catch (_) {
      emit(AuthFailure(message: _.toString()));
    }
  }

  /// Sign in
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());
    try {
      if (await networkInfo.isConnected()) {
        await userRepository.signIn(
          user: UserEntity(email: email, password: password),
        );
        final uid = await userRepository.getCurrentUId();
        emit(Authenticated(uid: uid));
      } else {
        emit(const AuthFailure(message: 'No Internet Connection'));
      }
    } on FirebaseException catch (_) {
      emit(
        AuthFailure(message: _.code),
      );
    } catch (_) {
      emit(AuthFailure(message: _.toString()));
    }
  }

  /// Sign-up
  Future<void> signUp({required UserEntity user}) async {
    emit(AuthLoading());
    try {
      if (await networkInfo.isConnected()) {
        await userRepository.signUp(user: user);
        emit(SignupSuccess());
      } else {
        emit(const AuthFailure(message: 'No Internet Connection'));
      }
    } on FirebaseException catch (_) {
      emit(AuthFailure(message: _.code));
    } catch (_) {
      emit(AuthFailure(message: _.toString()));
    }
  }

  /// Google Sign-In
  Future<void> googleSignin() async {
    emit(AuthLoading());
    try {
      if (await networkInfo.isConnected()) {
        await userRepository.googleAuth();
        final uid = await userRepository.getCurrentUId();
        emit(Authenticated(uid: uid));
      } else {
        emit(const AuthFailure(message: 'No Internet Connection'));
      }
    } on FirebaseException catch (_) {
      emit(AuthFailure(message: _.code));
    } catch (_) {
      emit(AuthFailure(message: _.toString()));
    }
  }

  /// sign out
  Future<void> signOut() async {
    await userRepository.signOut();
  }
}
