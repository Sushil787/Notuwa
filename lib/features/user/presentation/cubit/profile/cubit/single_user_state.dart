part of 'single_user_cubit.dart';

/// Single User State
abstract class SingleUserState extends Equatable {
  ///
  const SingleUserState();
}

/// Initial State
class SingleUserInitial extends SingleUserState {
  @override
  List<Object> get props => [];
}

/// Loading State
class SingleUserLoading extends SingleUserState {
  @override
  List<Object> get props => [];
}

/// Single User Loaded State
class SingleUserLoaded extends SingleUserState {
  ///
  const SingleUserLoaded({required this.currentUser});

  /// Current User
  final UserEntity currentUser;

  @override
  List<Object> get props => [currentUser];
}

/// Faliure State
class SingleUserFailure extends SingleUserState {
  ///
  const SingleUserFailure({required this.message});

  /// Error Message
  final String message;
  @override
  List<Object> get props => [message];

}
