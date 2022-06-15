part of 'visita_cubit.dart';

class VisitaState extends Equatable {
  final bool loadingVisitasFrecuentes;
  final List<VisitaFrecuenteModel> visitasFrecuentes;
  final List<TipoVisitaModel> tipoVisita;

  const VisitaState(
      {this.visitasFrecuentes = const [],
      this.tipoVisita = const [],
      this.loadingVisitasFrecuentes = false});

  VisitaState copyWith(
      {List<VisitaFrecuenteModel>? visitasFrecuentes,
      List<TipoVisitaModel>? tipoVisita,
      bool? loadingVisitasFrecuentes}) {
    return VisitaState(
        visitasFrecuentes: visitasFrecuentes ?? this.visitasFrecuentes,
        tipoVisita: tipoVisita ?? this.tipoVisita,
        loadingVisitasFrecuentes:
            loadingVisitasFrecuentes ?? this.loadingVisitasFrecuentes);
  }

  @override
  List<Object?> get props =>
      [visitasFrecuentes, loadingVisitasFrecuentes, tipoVisita];
}
