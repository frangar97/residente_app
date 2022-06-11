import 'package:dartz/dartz.dart';
import 'package:residente_app/core/error/exceptions.dart';
import 'package:residente_app/core/error/failures.dart';
import 'package:residente_app/features/auth/auth_datasource.dart';
import 'package:residente_app/features/auth/auth_model.dart';

abstract class AuthRepository {
  Future<Either<Failure, AuthModel>> login(String email, String password);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;

  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<Failure, AuthModel>> login(
      String email, String password) async {
    try {
      final response = await authDataSource.login(email, password);
      return Right(response);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
