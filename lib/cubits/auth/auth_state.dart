part of 'auth_cubit.dart';

class AuthState extends Equatable {
  final String email;
  bool get isValidUsername => email.length > 3;

  final String password;
  bool get isValidPassword => password.length > 6;

  final FormSubmissionStatus formStatus;

  const AuthState({
    this.email = '',
    this.password = '',
    this.formStatus = const InitialFormStatus(),
  });

  AuthState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formStatus,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [email, password, formStatus];
}
