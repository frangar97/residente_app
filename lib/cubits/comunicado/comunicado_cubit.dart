import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:residente_app/cubits/auth/form_submission_status.dart';
import 'package:residente_app/features/comunicado/comunicado_model.dart';
import 'package:residente_app/features/comunicado/comunicado_repository.dart';

part 'comunicado_state.dart';

class ComunicadoCubit extends Cubit<ComunicadoState> {
  final ComunicadoRepository comunicadoRepository;

  ComunicadoCubit({required this.comunicadoRepository})
      : super(const ComunicadoState());

  Future<void> cargarComunicados() async {
    emit(state.copyWith(loadingComunicados: true));

    final comunicados = await comunicadoRepository.getComunicados();

    emit(state.copyWith(
        loadingComunicados: false, listaComunicados: comunicados));
  }

  void seleccionarComunicado(ComunicadoModel comunicado) {
    emit(state.copyWith(comunicadoSelected: comunicado));
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

  Future<void> crearInicidente() async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    final result = await comunicadoRepository.createComunicado(
        state.fecha, state.titulo, state.descripcion);
    result.fold((l) => emit(state.copyWith(formStatus: SubmissionFailed())),
        (r) {
      emit(state.copyWith(
          formStatus: SubmissionSuccess(),
          listaComunicados: [...state.listaComunicados, r],
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
        descripcion: ""));
  }
}
