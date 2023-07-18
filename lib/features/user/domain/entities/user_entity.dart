import 'package:equatable/equatable.dart';

/// User Entity Class
class UserEntity extends Equatable {
  ///User Entity Constructor
  const UserEntity({
    this.uname,
    this.email,
    this.uid,
    this.password,
    this.status,
    this.profileUrl,
  });

  /// username
  final String? uname;

  /// user email
  final String? email;

  /// unique user id
  final String? uid;

  /// user password
  final String? password;

  /// user status
  final String? status;

  /// user profile url
  final String? profileUrl;

  @override
  List<Object?> get props => [
        uname,
        email,
        password,
        uid,
        profileUrl,
      ];
}
