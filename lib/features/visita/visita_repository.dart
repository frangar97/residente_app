import 'package:residente_app/features/visita/tipo_visita_model.dart';
import 'package:residente_app/features/visita/visita_datasource.dart';
import 'package:residente_app/features/visita/visita_model.dart';

abstract class VisitaRepository {
  Future<List<VisitaFrecuenteModel>> getVisitasFrecuentes();
  Future<List<TipoVisitaModel>> getTiposVisita();
}

class VisitaRepositoryImpl implements VisitaRepository {
  final VisitaDataSource dataSource;

  VisitaRepositoryImpl(this.dataSource);

  @override
  Future<List<VisitaFrecuenteModel>> getVisitasFrecuentes() async {
    final visitasFrecuentes = await dataSource.getVisitasFrecuentes();
    return visitasFrecuentes;
  }

  @override
  Future<List<TipoVisitaModel>> getTiposVisita() async {
    final tipos = await dataSource.getTiposVisita();
    return tipos;
  }
}
