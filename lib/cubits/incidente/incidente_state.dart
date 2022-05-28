part of 'incidente_cubit.dart';

class IncidenteState extends Equatable {
  final bool loadingIncidentes;
  final List<IncidenteModel> listaIncidentes;
  final IncidenteModel? incidenteSelected;

  const IncidenteState(
      {this.loadingIncidentes = false,
      this.listaIncidentes = const [],
      this.incidenteSelected});

  IncidenteState copyWith(
      {bool? loadingIncidentes,
      List<IncidenteModel>? listaIncidentes,
      IncidenteModel? incidenteSelected}) {
    return IncidenteState(
        incidenteSelected: incidenteSelected ?? this.incidenteSelected,
        loadingIncidentes: loadingIncidentes ?? this.loadingIncidentes,
        listaIncidentes: listaIncidentes ?? this.listaIncidentes);
  }

  @override
  List<Object?> get props =>
      [loadingIncidentes, listaIncidentes, incidenteSelected];
}
