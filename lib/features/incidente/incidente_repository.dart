import 'package:dartz/dartz.dart';
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/error/failures.dart';
import 'package:residente_app/features/incidente/incidente_datasource.dart';
import 'package:residente_app/features/incidente/incidente_model.dart';

abstract class IncidenteRepository {
  Future<List<IncidenteModel>> getIncidentes();
  Future<Either<Failure, IncidenteModel>> createIncidente(
      String fecha, String titulo, String lugar, String descripcion);
}

class IncidenteRepositoryImpl implements IncidenteRepository {
  final IncidenteDataSource dataSource;

  IncidenteRepositoryImpl(this.dataSource);

  @override
  Future<List<IncidenteModel>> getIncidentes() async {
    final incidentes = await dataSource.getIncidentes();
    return incidentes;
  }

  @override
  Future<Either<Failure, IncidenteModel>> createIncidente(
      String fecha, String titulo, String lugar, String descripcion) async {
    try {
      final incidente =
          await dataSource.createIncidente(fecha, titulo, lugar, descripcion);
      return Right(incidente);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
