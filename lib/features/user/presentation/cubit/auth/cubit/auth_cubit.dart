import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:kuraa/features/user/domain/repository/user_repository.dart';

part 'auth_state.dart';

/// Auth Cubit
@injectable
class AuthCubit extends Cubit<AuthState> {
  /// Constructor
  AuthCubit({required this.userRepository}) : super(AuthInitial());

  /// User Repo
  final UserRepository userRepository;

  /// App Started
  Future<void> appStarted() async {
    try {
      final isSignIn = await userRepository.isSignIn();

      if (isSignIn == true) {
        final uid = await userRepository.getCurrentUId();

        emit(Authenticated(uid: uid));
      } else {
        emit(UnAuthenticated());
      }
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  /// Logged in check
  Future<void> loggedIn() async {
    try {
      final uid = await userRepository.getCurrentUId();

      emit(Authenticated(uid: uid));
    } catch (_) {
      emit(UnAuthenticated());
    }
  }

  /// log out
  Future<void> logOut() async {
    try {
      await userRepository.signOut();
      emit(UnAuthenticated());
    } catch (_) {
      emit(UnAuthenticated());
    }
  }
}
