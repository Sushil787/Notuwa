import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';
import 'package:kuraa/features/user/domain/repository/user_repository.dart';

part 'single_user_state.dart';

/// Single User Cubit
class SingleUserCubit extends Cubit<SingleUserState> {
  /// Constructor
  SingleUserCubit({required this.userRepository}) : super(SingleUserInitial());

  /// User Repository
  final UserRepository userRepository;

  /// Gets The User Profile
  Future<void> getSingleUserProfile({required UserEntity user}) async {
    emit(SingleUserLoading());
    try {
      userRepository.getSingleUser(user: user).listen((user) {
        emit(SingleUserLoaded(currentUser: user.first));
      });
    } on SocketException catch (_) {
      emit(SingleUserFailure());
    } catch (_) {
      emit(SingleUserFailure());
    }
  }
}
