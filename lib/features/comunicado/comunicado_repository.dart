import 'package:dartz/dartz.dart';
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/error/failures.dart';
import 'package:residente_app/features/comunicado/comunicado_datasource.dart';
import 'package:residente_app/features/comunicado/comunicado_model.dart';

abstract class ComunicadoRepository {
  Future<List<ComunicadoModel>> getComunicados();
  Future<Either<Failure, ComunicadoModel>> createComunicado(
      String fecha, String titulo, String descripcion);
}

class ComunicadoRepositoryImpl implements ComunicadoRepository {
  final ComunicadoDataSource dataSource;

  ComunicadoRepositoryImpl(this.dataSource);

  @override
  Future<List<ComunicadoModel>> getComunicados() async {
    final comunicados = await dataSource.getComunicados();
    return comunicados;
  }

  @override
  Future<Either<Failure, ComunicadoModel>> createComunicado(
      String fecha, String titulo, String descripcion) async {
    try {
      final comunicado =
          await dataSource.createComunicado(fecha, titulo, descripcion);
      return Right(comunicado);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
