import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';
import 'package:kuraa/features/user/domain/repository/user_repository.dart';

part 'user_state.dart';

@injectable

/// User Cubit
class UserCubit extends Cubit<UserState> {
  /// Public Constructor
  UserCubit({required this.userRepository}) : super(UserInitial());

  /// User Repo instance
  final UserRepository userRepository;

  /// Get Users
  Future<void> getUsers({required UserEntity user}) async {
    emit(UserLoading());
    try {
      userRepository.getAllUsers(user: user).listen((users) {
        emit(UserLoaded(users: users));
      });
    } on FirebaseException catch (_) {
      emit(UserFailure(message: _.code));
    } catch (_) {
      emit(UserFailure(message: _.toString()));
    }
  }

  /// Update User
  Future<void> getUpdateUser({required UserEntity user}) async {
    try {
      await userRepository.getUpdateUser(user: user);
    } on FirebaseException catch (_) {
      emit(UserFailure(message: _.code));
    } catch (_) {
      emit(UserFailure(message: _.toString()));
    }
  }
}
