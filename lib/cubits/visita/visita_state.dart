part of 'visita_cubit.dart';

class VisitaState extends Equatable {
  final bool loadingVisitasFrecuentes;
  final bool loadingVisitasEventuales;
  final List<VisitaFrecuenteModel> visitasFrecuentes;
  final List<VisitaEventualModel> visitasEventuales;
  final VisitaFrecuenteModel? visitaFrecuenteSeleccionada;
  final VisitaEventualModel? visitaEventualSeleccionada;
  final List<TipoVisitaModel> tipoVisita;
  final TipoVisitaModel? tipoVisitaSeleccionado;
  final String nombre;
  final String nota;
  final String fecha;
  final FormSubmissionStatus formStatus;

  const VisitaState(
      {this.visitasFrecuentes = const [],
      this.tipoVisita = const [],
      this.loadingVisitasFrecuentes = false,
      this.tipoVisitaSeleccionado,
      this.fecha = "",
      this.nombre = "",
      this.nota = "",
      this.formStatus = const InitialFormStatus(),
      this.visitaFrecuenteSeleccionada,
      this.loadingVisitasEventuales = false,
      this.visitaEventualSeleccionada,
      this.visitasEventuales = const []});

  VisitaState copyWith(
      {List<VisitaFrecuenteModel>? visitasFrecuentes,
      List<TipoVisitaModel>? tipoVisita,
      bool? loadingVisitasFrecuentes,
      bool? loadingVisitasEventuales,
      TipoVisitaModel? tipoVisitaSeleccionado,
      String? nombre,
      String? nota,
      String? fecha,
      FormSubmissionStatus? formStatus,
      VisitaFrecuenteModel? visitaFrecuenteSeleccionada,
      List<VisitaEventualModel>? visitasEventuales,
      VisitaEventualModel? visitaEventualSeleccionada}) {
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
        formStatus: formStatus ?? this.formStatus,
        visitaFrecuenteSeleccionada: visitaFrecuenteSeleccionada,
        loadingVisitasEventuales:
            loadingVisitasEventuales ?? this.loadingVisitasEventuales,
        visitasEventuales: visitasEventuales ?? this.visitasEventuales,
        visitaEventualSeleccionada: visitaEventualSeleccionada);
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
        formStatus,
        visitaFrecuenteSeleccionada,
        loadingVisitasEventuales,
        visitasEventuales,
        visitaEventualSeleccionada
      ];
}
