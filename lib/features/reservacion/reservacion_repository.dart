import 'package:dartz/dartz.dart';
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/error/failures.dart';
import 'package:residente_app/features/reservacion/reservacion_datasource.dart';
import 'package:residente_app/features/reservacion/reservacion_model.dart';

abstract class ReservacionRepository {
  Future<List<ReservacionModel>> getReservaciones();
  Future<Either<Failure, ReservacionModel>> createReservacion(
      String fecha, String titulo, String lugar, String descripcion);
}

class ReservacionRepositoryImpl implements ReservacionRepository {
  final ReservacionDataSource dataSource;

  ReservacionRepositoryImpl(this.dataSource);

  @override
  Future<List<ReservacionModel>> getReservaciones() async {
    final reservaciones = await dataSource.getReservaciones();
    return reservaciones;
  }

  @override
  Future<Either<Failure, ReservacionModel>> createReservacion(
      String fecha, String titulo, String lugar, String descripcion) async {
    try {
      final reservacion =
          await dataSource.createReservacion(fecha, titulo, lugar, descripcion);
      return Right(reservacion);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
