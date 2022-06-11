import 'package:residente_app/features/visita/visita_datasource.dart';
import 'package:residente_app/features/visita/visita_model.dart';

abstract class VisitaRepository {
  Future<List<VisitaFrecuenteModel>> getVisitasFrecuentes();
}

class VisitaRepositoryImpl implements VisitaRepository {
  final VisitaDataSource dataSource;

  VisitaRepositoryImpl(this.dataSource);

  @override
  Future<List<VisitaFrecuenteModel>> getVisitasFrecuentes() async {
    final visitasFrecuentes = await dataSource.getVisitasFrecuentes();
    return visitasFrecuentes;
  }
}
