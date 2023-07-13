part of 'credential_cubit.dart';

/// Credential State
abstract class CredentialState extends Equatable {
  /// Public constructor
  const CredentialState();
}

/// Credential Initial State
class CredentialInitial extends CredentialState {
  @override
  List<Object> get props => [];
}

/// Credential Loading State
class CredentialLoading extends CredentialState {
  @override
  List<Object> get props => [];
}

///  Credential Success State
class CredentialSuccess extends CredentialState {
  @override
  List<Object> get props => [];
}

/// Credential Faliure State
class CredentialFailure extends CredentialState {
  ///
  const CredentialFailure({required this.message});

  /// Faliure Messsage
  final String message;
  @override
  List<Object> get props => [message];
}
