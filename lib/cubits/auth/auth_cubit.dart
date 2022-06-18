import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:residente_app/cubits/auth/form_submission_status.dart';
import 'package:residente_app/features/auth/auth_model.dart';
import 'package:residente_app/features/auth/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState());

  void onChangeEmail(String email) {
    emit(state.copyWith(email: email, formStatus: const InitialFormStatus()));
  }

  void onChangePassword(String password) {
    emit(state.copyWith(
        password: password, formStatus: const InitialFormStatus()));
  }

  Future<void> login() async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    final result = await _authRepository.login(state.email, state.password);
    result.fold(
        (l) => emit(state.copyWith(formStatus: SubmissionFailed())),
        (r) =>
            emit(state.copyWith(formStatus: SubmissionSuccess(), usuario: r)));
  }
}
