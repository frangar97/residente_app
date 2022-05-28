import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
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
}
