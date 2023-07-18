import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kuraa/features/user/domain/entities/user_entity.dart';
import 'package:kuraa/features/user/domain/repository/user_repository.dart';

part 'profile_state.dart';

@injectable

/// Single User Cubit
class ProfileCubit extends Cubit<ProfileState> {
  /// Constructor
  ProfileCubit({required this.userRepository}) : super(ProfileInitial());

  /// User Repository
  final UserRepository userRepository;

  /// Gets The User Profile
  Future<void> getProfileProfile({required String uid}) async {
    emit(ProfileLoading());
    try {
      userRepository.getSingleUser(uid: uid).listen((user) {
        emit(ProfileLoaded(currentUser: user.first));
        log(user.toString());
      });
    } on FirebaseException catch (_) {
      emit(ProfileFailure(message: _.code));
    } catch (_) {
      emit(ProfileFailure(message: _.toString()));
    }
  }
}
