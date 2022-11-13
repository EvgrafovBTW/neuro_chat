part of 'user_credential_cubit.dart';

class UserCredentialState {
  String login;
  String email;
  String password;
  UserCredentialState({
    this.login = 'a',
    this.email = 'a',
    this.password = 'a',
  });
  UserCredentialState copyWith({
    String? login,
    String? email,
    String? password,
  }) {
    return UserCredentialState(
      login: login ?? this.login,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
