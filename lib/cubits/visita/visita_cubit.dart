import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:residente_app/features/visita/visita_model.dart';
import 'package:residente_app/features/visita/visita_repository.dart';

part 'visita_state.dart';

class VisitaCubit extends Cubit<VisitaState> {
  final VisitaRepository visitaRepository;

  VisitaCubit({required this.visitaRepository}) : super(const VisitaState());

  Future<void> cargarVisitasFrecuentes() async {
    emit(state.copyWith(loadingVisitasFrecuentes: true));
    final visitasFrecuentes = await visitaRepository.getVisitasFrecuentes();
    emit(state.copyWith(
        loadingVisitasFrecuentes: false, visitasFrecuentes: visitasFrecuentes));
  }
}
