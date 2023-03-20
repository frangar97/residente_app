import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:residente_app/cubits/auth/form_submission_status.dart';
import 'package:residente_app/features/reservacion/reservacion_model.dart';
import 'package:residente_app/features/reservacion/reservacion_repository.dart';

part 'reservacion_state.dart';

class ReservacionCubit extends Cubit<ReservacionState> {
  final ReservacionRepository reservacionRepository;

  ReservacionCubit({required this.reservacionRepository})
      : super(const ReservacionState());

  Future<void> cargarReservaciones() async {
    emit(state.copyWith(loadingReservaciones: true));

    final incidentes = await reservacionRepository.getReservaciones();

    emit(state.copyWith(
        loadingReservaciones: false,
        listaReservaciones: incidentes,
        reservacionSeleccionada: null));
  }

  void seleccionarReservacion(ReservacionModel reservacion) {
    emit(state.copyWith(reservacionSeleccionada: reservacion));
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

  Future<void> crearReservacion() async {
    emit(state.copyWith(formStatus: FormSubmitting()));
    final result = await reservacionRepository.createReservacion(
        state.fecha, state.titulo, state.lugar, state.descripcion);
    result.fold((l) => emit(state.copyWith(formStatus: SubmissionFailed())),
        (r) {
      emit(state.copyWith(
          formStatus: SubmissionSuccess(),
          listaReservaciones: [...state.listaReservaciones, r],
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
