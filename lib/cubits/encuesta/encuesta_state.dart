part of 'encuesta_cubit.dart';

class EncuestaState extends Equatable {
  final bool loadingEncuestas;
  final List<EncuestaModel> listaEncuestas;
  final EncuestaModel? encuestaSelected;

  const EncuestaState(
      {this.loadingEncuestas = false,
      this.listaEncuestas = const [],
      this.encuestaSelected});

  EncuestaState copyWith(
      {bool? loadingEncuestas,
      List<EncuestaModel>? listaEncuestas,
      EncuestaModel? encuestaSelected}) {
    return EncuestaState(
        encuestaSelected: encuestaSelected ?? this.encuestaSelected,
        loadingEncuestas: loadingEncuestas ?? this.loadingEncuestas,
        listaEncuestas: listaEncuestas ?? this.listaEncuestas);
  }

  @override
  List<Object?> get props =>
      [loadingEncuestas, listaEncuestas, encuestaSelected];
}
