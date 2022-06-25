part of 'reservacion_cubit.dart';

class ReservacionState extends Equatable {
  final bool loadingReservaciones;
  final List<ReservacionModel> listaReservaciones;
  final ReservacionModel? reservacionSeleccionada;
  final String titulo;
  final String descripcion;
  final String lugar;
  final String fecha;
  final FormSubmissionStatus formStatus;

  const ReservacionState({
    this.listaReservaciones = const [],
    this.loadingReservaciones = false,
    this.reservacionSeleccionada,
    this.titulo = "",
    this.descripcion = "",
    this.fecha = "",
    this.lugar = "",
    this.formStatus = const InitialFormStatus(),
  });

  ReservacionState copyWith({
    bool? loadingReservaciones,
    List<ReservacionModel>? listaReservaciones,
    ReservacionModel? reservacionSeleccionada,
    String? titulo,
    String? descripcion,
    String? lugar,
    String? fecha,
    FormSubmissionStatus? formStatus,
  }) {
    return ReservacionState(
      loadingReservaciones: loadingReservaciones ?? this.loadingReservaciones,
      listaReservaciones: listaReservaciones ?? this.listaReservaciones,
      reservacionSeleccionada: reservacionSeleccionada,
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      lugar: lugar ?? this.lugar,
      fecha: fecha ?? this.fecha,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [
        listaReservaciones,
        loadingReservaciones,
        reservacionSeleccionada,
        titulo,
        descripcion,
        lugar,
        fecha,
        formStatus
      ];
}
