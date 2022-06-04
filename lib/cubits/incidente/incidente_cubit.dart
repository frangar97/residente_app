import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:residente_app/cubits/auth/form_submission_status.dart';
import 'package:residente_app/features/incidente/incidente_model.dart';
import 'package:residente_app/features/incidente/incidente_repository.dart';

part 'incidente_state.dart';

class IncidenteCubit extends Cubit<IncidenteState> {
  final IncidenteRepository incidenteRepository;

  IncidenteCubit({required this.incidenteRepository})
      : super(const IncidenteState());

  Future<void> cargarIncidentes() async {
    emit(state.copyWith(loadingIncidentes: true));

    final incidentes = await incidenteRepository.getIncidentes();

    emit(state.copyWith(loadingIncidentes: false, listaIncidentes: incidentes));
  }

  void seleccionarIncidente(IncidenteModel incidente) {
    emit(state.copyWith(incidenteSelected: incidente));
  }

  void onChangeTitulo(String titulo) {
    emit(state.copyWith(titulo: titulo));
  }

  void onChangeLugar(String lugar) {
    emit(state.copyWith(lugar: lugar));
  }

  void onChangeDescripcion(String descripcion) {
    emit(state.copyWith(descripcion: descripcion));
  }

  void onChangeFecha(String fecha) {
    emit(state.copyWith(fecha: fecha));
  }

  Future<void> crearInicidente() async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    final result = await incidenteRepository.createIncidente(
        state.fecha, state.titulo, state.lugar, state.descripcion);
    result.fold((l) => emit(state.copyWith(formStatus: SubmissionFailed())),
        (r) {
      emit(state.copyWith(
          formStatus: SubmissionSuccess(),
          listaIncidentes: [...state.listaIncidentes, r],
          fecha: "",
          lugar: "",
          titulo: "",
          descripcion: ""));
    });
  }

  void resetearCreacion() {
    emit(state.copyWith(
        formStatus: const InitialFormStatus(),
        fecha: "",
        lugar: "",
        titulo: "",
        descripcion: ""));
  }
}
