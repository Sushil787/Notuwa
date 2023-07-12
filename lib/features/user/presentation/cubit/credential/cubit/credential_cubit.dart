import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

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
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
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
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  /// Sign-up
  Future<void> signUpSubmit({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      await userRepository.signUp(user: user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  /// Google Sign-In
  Future<void> googleSignin() async {
    emit(CredentialLoading());
    try {
      await userRepository.googleAuth();
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
