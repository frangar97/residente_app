import 'package:dartz/dartz.dart';
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/error/failures.dart';
import 'package:residente_app/features/visita/tipo_visita_model.dart';
import 'package:residente_app/features/visita/visita_datasource.dart';
import 'package:residente_app/features/visita/visita_model.dart';

abstract class VisitaRepository {
  Future<List<VisitaFrecuenteModel>> getVisitasFrecuentes();
  Future<List<VisitaEventualModel>> getVisitasEventuales();
  Future<List<TipoVisitaModel>> getTiposVisita();
  Future<Either<Failure, bool>> crearVisitaFrecuente(
      String nombre, String nota, int tipoVisitaId, String fecha);
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

  @override
  Future<Either<Failure, bool>> crearVisitaFrecuente(
      String nombre, String nota, int tipoVisitaId, String fecha) async {
    try {
      final visitaFrecuente = await dataSource.crearVisitaFrecuente(
          nombre, nota, tipoVisitaId, fecha);
      return right(visitaFrecuente);
    } on ServerException {
      return left(ServerFailure());
    }
  }

  @override
  Future<List<VisitaEventualModel>> getVisitasEventuales() async {
    final visitasEventuales = await dataSource.getVisitasEventuales();
    return visitasEventuales;
  }
}
