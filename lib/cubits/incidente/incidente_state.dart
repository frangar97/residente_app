part of 'incidente_cubit.dart';

class IncidenteState extends Equatable {
  final bool loadingIncidentes;
  final List<IncidenteModel> listaIncidentes;
  final IncidenteModel? incidenteSelected;
  final String titulo;
  final String descripcion;
  final String lugar;
  final String fecha;
  final FormSubmissionStatus formStatus;

  const IncidenteState({
    this.loadingIncidentes = false,
    this.listaIncidentes = const [],
    this.incidenteSelected,
    this.titulo = "",
    this.descripcion = "",
    this.fecha = "",
    this.lugar = "",
    this.formStatus = const InitialFormStatus(),
  });

  IncidenteState copyWith({
    bool? loadingIncidentes,
    List<IncidenteModel>? listaIncidentes,
    IncidenteModel? incidenteSelected,
    String? titulo,
    String? descripcion,
    String? lugar,
    String? fecha,
    FormSubmissionStatus? formStatus,
  }) {
    return IncidenteState(
      titulo: titulo ?? this.titulo,
      descripcion: descripcion ?? this.descripcion,
      lugar: lugar ?? this.lugar,
      fecha: fecha ?? this.fecha,
      incidenteSelected: incidenteSelected ?? this.incidenteSelected,
      loadingIncidentes: loadingIncidentes ?? this.loadingIncidentes,
      listaIncidentes: listaIncidentes ?? this.listaIncidentes,
      formStatus: formStatus ?? this.formStatus,
    );
  }

  @override
  List<Object?> get props => [
        loadingIncidentes,
        listaIncidentes,
        incidenteSelected,
        titulo,
        descripcion,
        lugar,
        fecha,
        formStatus
      ];
}
