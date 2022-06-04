import 'package:dartz/dartz.dart';
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/error/failures.dart';
import 'package:residente_app/features/encuesta/encuesta_datasource.dart';
import 'package:residente_app/features/encuesta/encuesta_model.dart';

abstract class EncuestaRepository {
  Future<List<EncuestaModel>> getEncuestas();
  Future<Either<Failure, EncuestaModel>> createEncuesta(
      String fecha, String titulo, String link, String descripcion);
}

class EncuestaRepositoryImpl implements EncuestaRepository {
  final EncuestaDataSource dataSource;

  EncuestaRepositoryImpl(this.dataSource);

  @override
  Future<List<EncuestaModel>> getEncuestas() async {
    final encuestas = await dataSource.getEncuestas();
    return encuestas;
  }

  @override
  Future<Either<Failure, EncuestaModel>> createEncuesta(
      String fecha, String titulo, String link, String descripcion) async {
    try {
      final encuesta =
          await dataSource.createEncuesta(fecha, titulo, link, descripcion);
      return Right(encuesta);
    } on ServerException {
      return left(ServerFailure());
    }
  }
}
