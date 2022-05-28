import 'package:residente_app/features/incidente/incidente_datasource.dart';
import 'package:residente_app/features/incidente/incidente_model.dart';

abstract class IncidenteRepository {
  Future<List<IncidenteModel>> getIncidentes();
}

class IncidenteRepositoryImpl implements IncidenteRepository {
  final IncidenteDataSource dataSource;

  IncidenteRepositoryImpl(this.dataSource);

  @override
  Future<List<IncidenteModel>> getIncidentes() async {
    final incidentes = await dataSource.getIncidentes();
    return incidentes;
  }
}
