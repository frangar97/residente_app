import 'package:get_it/get_it.dart';
import 'package:residente_app/features/auth/auth_repository.dart';
import 'package:residente_app/features/comunicado/comunicado_repository.dart';

void registerRepositories(GetIt sl) {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<ComunicadoRepository>(() => ComunicadoRepositoryImpl(sl()));
}
