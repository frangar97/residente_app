part of 'visita_cubit.dart';

class VisitaState extends Equatable {
  final bool loadingVisitasFrecuentes;
  final List<VisitaFrecuenteModel> visitasFrecuentes;
  final List<TipoVisitaModel> tipoVisita;
  final TipoVisitaModel? tipoVisitaSeleccionado;
  final String nombre;
  final String nota;
  final String fecha;
  final FormSubmissionStatus formStatus;

  const VisitaState({
    this.visitasFrecuentes = const [],
    this.tipoVisita = const [],
    this.loadingVisitasFrecuentes = false,
    this.tipoVisitaSeleccionado,
    this.fecha = "",
    this.nombre = "",
    this.nota = "",
    this.formStatus = const InitialFormStatus(),
  });

  VisitaState copyWith({
    List<VisitaFrecuenteModel>? visitasFrecuentes,
    List<TipoVisitaModel>? tipoVisita,
    bool? loadingVisitasFrecuentes,
    TipoVisitaModel? tipoVisitaSeleccionado,
    String? nombre,
    String? nota,
    String? fecha,
    FormSubmissionStatus? formStatus,
  }) {
    return VisitaState(
        visitasFrecuentes: visitasFrecuentes ?? this.visitasFrecuentes,
        tipoVisita: tipoVisita ?? this.tipoVisita,
        loadingVisitasFrecuentes:
            loadingVisitasFrecuentes ?? this.loadingVisitasFrecuentes,
        tipoVisitaSeleccionado:
            tipoVisitaSeleccionado ?? this.tipoVisitaSeleccionado,
        nombre: nombre ?? this.nombre,
        nota: nota ?? this.nota,
        fecha: fecha ?? this.fecha,
        formStatus: formStatus ?? this.formStatus);
  }

  @override
  List<Object?> get props => [
        visitasFrecuentes,
        loadingVisitasFrecuentes,
        tipoVisita,
        tipoVisitaSeleccionado,
        nombre,
        nota,
        fecha,
        formStatus
      ];
}
