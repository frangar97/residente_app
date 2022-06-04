import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:residente_app/cubits/auth/form_submission_status.dart';
import 'package:residente_app/features/encuesta/encuesta_model.dart';
import 'package:residente_app/features/encuesta/encuesta_repository.dart';

part 'encuesta_state.dart';

class EncuestaCubit extends Cubit<EncuestaState> {
  final EncuestaRepository encuestaRepository;

  EncuestaCubit({required this.encuestaRepository})
      : super(const EncuestaState());

  Future<void> cargarEncuestas() async {
    emit(state.copyWith(loadingEncuestas: true));

    final encuestas = await encuestaRepository.getEncuestas();

    emit(state.copyWith(loadingEncuestas: false, listaEncuestas: encuestas));
  }

  void seleccionarEncuesta(EncuestaModel encuesta) {
    emit(state.copyWith(encuestaSelected: encuesta));
  }

  void onChangeTitulo(String titulo) {
    emit(state.copyWith(titulo: titulo));
  }

  void onChangeDescripcion(String descripcion) {
    emit(state.copyWith(descripcion: descripcion));
  }

  void onChangeFecha(String fecha) {
    emit(state.copyWith(fecha: fecha));
  }

  void onChangeLink(String link) {
    emit(state.copyWith(link: link));
  }

  Future<void> crearEncuesta() async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    final result = await encuestaRepository.createEncuesta(
        state.fecha, state.titulo, state.link, state.descripcion);
    result.fold((l) => emit(state.copyWith(formStatus: SubmissionFailed())),
        (r) {
      emit(state.copyWith(
          formStatus: SubmissionSuccess(),
          listaEncuestas: [...state.listaEncuestas, r],
          fecha: "",
          titulo: "",
          descripcion: ""));
    });
  }

  void resetearCreacion() {
    emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        fecha: "",
        titulo: "",
        link: "",
        descripcion: ""));
  }
}
