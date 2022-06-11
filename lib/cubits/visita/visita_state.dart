part of 'visita_cubit.dart';

class VisitaState extends Equatable {
  final bool loadingVisitasFrecuentes;
  final List<VisitaFrecuenteModel> visitasFrecuentes;

  const VisitaState(
      {this.visitasFrecuentes = const [],
      this.loadingVisitasFrecuentes = false});

  VisitaState copyWith(
      {List<VisitaFrecuenteModel>? visitasFrecuentes,
      bool? loadingVisitasFrecuentes}) {
    return VisitaState(
        visitasFrecuentes: visitasFrecuentes ?? this.visitasFrecuentes,
        loadingVisitasFrecuentes:
            loadingVisitasFrecuentes ?? this.loadingVisitasFrecuentes);
  }

  @override
  List<Object?> get props => [visitasFrecuentes, loadingVisitasFrecuentes];
}
