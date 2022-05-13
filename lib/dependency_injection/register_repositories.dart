import 'package:get_it/get_it.dart';
import 'package:residente_app/features/auth/auth_repository.dart';

void registerRepositories(GetIt sl) {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
}
