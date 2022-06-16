import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:residente_app/cubits/auth/form_submission_status.dart';
import 'package:residente_app/features/visita/tipo_visita_model.dart';
import 'package:residente_app/features/visita/visita_model.dart';
import 'package:residente_app/features/visita/visita_repository.dart';

part 'visita_state.dart';

class VisitaCubit extends Cubit<VisitaState> {
  final VisitaRepository visitaRepository;

  VisitaCubit({required this.visitaRepository}) : super(const VisitaState());

  void seleccionarTipoVisita(TipoVisitaModel? tipoVisita) {
    emit(state.copyWith(tipoVisitaSeleccionado: tipoVisita));
  }

  void seleccionarVisitaFrecuente(VisitaFrecuenteModel visita) {
    emit(state.copyWith(visitaFrecuenteSeleccionada: visita));
  }

  void onChangeNombre(String nombre) {
    emit(state.copyWith(nombre: nombre));
  }

  void onChangeNota(String nota) {
    emit(state.copyWith(nota: nota));
  }

  void onChangeFecha(String fecha) {
    emit(state.copyWith(fecha: fecha));
  }

  Future<void> crearVisitaEventual() async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    final result = await visitaRepository.crearVisitaFrecuente(state.nombre,
        state.nota, state.tipoVisitaSeleccionado!.id, state.fecha);
    result.fold((l) => emit(state.copyWith(formStatus: SubmissionFailed())),
        (r) async {
      final visitasFrecuentes = await visitaRepository.getVisitasFrecuentes();
      emit(state.copyWith(
          formStatus: SubmissionSuccess(),
          visitasFrecuentes: visitasFrecuentes,
          fecha: "",
          nombre: "",
          nota: ""));
    });
  }

  Future<void> cargarVisitasFrecuentes() async {
    emit(state.copyWith(loadingVisitasFrecuentes: true));
    final visitasFrecuentes = await visitaRepository.getVisitasFrecuentes();
    final tipos = await visitaRepository.getTiposVisita();
    if (tipos.isNotEmpty) {
      emit(state.copyWith(
          loadingVisitasFrecuentes: false,
          visitasFrecuentes: visitasFrecuentes,
          tipoVisita: tipos,
          tipoVisitaSeleccionado: tipos[0]));
    } else {
      emit(state.copyWith(
          loadingVisitasFrecuentes: false,
          visitasFrecuentes: visitasFrecuentes,
          tipoVisita: tipos));
    }
  }
}
