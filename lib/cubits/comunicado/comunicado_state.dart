part of 'comunicado_cubit.dart';

class ComunicadoState extends Equatable {
  final bool loadingComunicados;
  final List<ComunicadoModel> listaComunicados;
  final ComunicadoModel? comunicadoSelected;

  const ComunicadoState(
      {this.loadingComunicados = false,
      this.listaComunicados = const [],
      this.comunicadoSelected});

  ComunicadoState copyWith(
      {bool? loadingComunicados,
      List<ComunicadoModel>? listaComunicados,
      ComunicadoModel? comunicadoSelected}) {
    return ComunicadoState(
        comunicadoSelected: comunicadoSelected ?? this.comunicadoSelected,
        loadingComunicados: loadingComunicados ?? this.loadingComunicados,
        listaComunicados: listaComunicados ?? this.listaComunicados);
  }

  @override
  List<Object?> get props =>
      [loadingComunicados, listaComunicados, comunicadoSelected];
}
