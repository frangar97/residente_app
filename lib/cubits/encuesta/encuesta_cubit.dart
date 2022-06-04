import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:residente_app/features/encuesta/encuesta_model.dart';
import 'package:residente_app/features/encuesta/encuesta_repository.dart';

part 'encuesta_state.dart';

class EncuestaCubit extends Cubit<EncuestaState> {
  final EncuestaRepository encuestaRepository;

  EncuestaCubit({required this.encuestaRepository})
      : super(const EncuestaState());

  Future<void> cargarEncuestas() async {
    emit(state.copyWith(loadingEncuestas: true));

    final encuestas = await encuestaRepository.getEncuestas();

    emit(state.copyWith(loadingEncuestas: false, listaEncuestas: encuestas));
  }

  void seleccionarEncuesta(EncuestaModel encuesta) {
    emit(state.copyWith(encuestaSelected: encuesta));
  }
}
