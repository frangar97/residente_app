import 'package:residente_app/features/encuesta/encuesta_datasource.dart';
import 'package:residente_app/features/encuesta/encuesta_model.dart';

abstract class EncuestaRepository {
  Future<List<EncuestaModel>> getEncuestas();
}

class EncuestaRepositoryImpl implements EncuestaRepository {
  final EncuestaDataSource dataSource;

  EncuestaRepositoryImpl(this.dataSource);

  @override
  Future<List<EncuestaModel>> getEncuestas() async {
    final encuestas = await dataSource.getEncuestas();
    return encuestas;
  }
}
