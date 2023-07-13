part of 'user_cubit.dart';

/// User State
abstract class UserState extends Equatable {
  /// Constructor
  const UserState();
}

/// Initial State
class UserInitial extends UserState {
  @override
  List<Object> get props => [];
}

/// Loading State
class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

/// User Loaded State
class UserLoaded extends UserState {
  /// Constructor
  const UserLoaded({required this.users});

  /// Users List
  final List<UserEntity> users;

  @override
  List<Object> get props => [users];
}

/// Faliure State
class UserFailure extends UserState {
  ///
  const UserFailure({required this.message});

  ///
  final String message;
  @override
  List<Object> get props => [];
}
