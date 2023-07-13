import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:injectable/injectable.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';
import 'package:kuraa/features/user/domain/repository/user_repository.dart';

part 'credential_state.dart';

@injectable

/// Credential Cubit
class CredentialCubit extends Cubit<CredentialState> {
  /// Credential Cubit
  CredentialCubit({required this.userRepository}) : super(CredentialInitial());

  /// User Repository
  final UserRepository userRepository;

  /// Forgot password
  Future<void> forgotPassword({required String email}) async {
    try {
      await userRepository.forgotPassword(email: email);
    } on FirebaseException catch (_) {
      emit(CredentialFailure(message: _.code));
    } catch (_) {
      emit(CredentialFailure(message: _.toString()));
    }
  }

  /// Sign in
  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    emit(CredentialLoading());
    try {
      await userRepository.signIn(
        user: UserEntity(email: email, password: password),
      );
      final userId = await userRepository.getCurrentUId();
      emit(CredentialSuccess(userId));
    } on FirebaseException catch (_) {
      emit(CredentialFailure(message: _.code));
    } catch (_) {
      emit(CredentialFailure(message: _.toString()));
    }
  }

  /// Sign-up
  Future<void> signUp({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await userRepository.signUp(user: user);
      emit(const CredentialSuccess(''));
    } on FirebaseException catch (_) {
      emit(CredentialFailure(message: _.code));
    } catch (_) {
      emit(CredentialFailure(message: _.toString()));
    }
  }

  /// Google Sign-In
  Future<void> googleSignin() async {
    emit(CredentialLoading());
    try {
      await userRepository.googleAuth();
      final userId = await userRepository.getCurrentUId();
      emit(CredentialSuccess(userId));
    } on FirebaseException catch (_) {
      emit(CredentialFailure(message: _.code));
    } catch (_) {
      emit(CredentialFailure(message: _.toString()));
    }
  }
}
