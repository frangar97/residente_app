import 'package:residente_app/features/comunicado/comunicado_datasource.dart';
import 'package:residente_app/features/comunicado/comunicado_model.dart';

abstract class ComunicadoRepository {
  Future<List<ComunicadoModel>> getComunicados();
}

class ComunicadoRepositoryImpl implements ComunicadoRepository {
  final ComunicadoDataSource dataSource;

  ComunicadoRepositoryImpl(this.dataSource);

  @override
  Future<List<ComunicadoModel>> getComunicados() async {
    final comunicados = await dataSource.getComunicados();
    return comunicados;
  }
}
