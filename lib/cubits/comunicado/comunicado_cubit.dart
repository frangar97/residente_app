import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:residente_app/features/comunicado/comunicado_model.dart';
import 'package:residente_app/features/comunicado/comunicado_repository.dart';

part 'comunicado_state.dart';

class ComunicadoCubit extends Cubit<ComunicadoState> {
  final ComunicadoRepository comunicadoRepository;

  ComunicadoCubit({required this.comunicadoRepository})
      : super(const ComunicadoState());

  Future<void> cargarComunicados() async {
    emit(state.copyWith(loadingComunicados: true));

    final comunicados = await comunicadoRepository.getComunicados();

    emit(state.copyWith(
        loadingComunicados: false, listaComunicados: comunicados));
  }

  void seleccionarComunicado(ComunicadoModel comunicado) {
    emit(state.copyWith(comunicadoSelected: comunicado));
  }
}
