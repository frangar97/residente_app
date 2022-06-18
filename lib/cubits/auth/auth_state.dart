part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String email;
  bool get isValidUsername => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  final AuthModel? usuario;

  const AuthState(
      {this.email = '',
      this.password = '',
      this.formStatus = const InitialFormStatus(),
      this.usuario});

  AuthState copyWith(
      {String? email,
      String? password,
      FormSubmissionStatus? formStatus,
      AuthModel? usuario}) {
    return AuthState(
        email: email ?? this.email,
        password: password ?? this.password,
        formStatus: formStatus ?? this.formStatus,
        usuario: usuario ?? this.usuario);
  }

  @override
  List<Object?> get props => [email, password, formStatus, usuario];
}
