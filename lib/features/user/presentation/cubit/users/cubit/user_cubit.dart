import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';
import 'package:kuraa/features/user/domain/repository/user_repository.dart';

part 'user_state.dart';

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
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }

  /// Update User
  Future<void> getUpdateUser({required UserEntity user}) async {
    try {
      await userRepository.getUpdateUser(user: user);
    } on SocketException catch (_) {
      emit(UserFailure());
    } catch (_) {
      emit(UserFailure());
    }
  }
}
