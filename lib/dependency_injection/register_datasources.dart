import 'package:get_it/get_it.dart';
import 'package:residente_app/features/auth/auth_datasource.dart';
import 'package:residente_app/features/comunicado/comunicado_datasource.dart';

void registerDataSources(GetIt sl) {
  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(client: sl()));

  sl.registerLazySingleton<ComunicadoDataSource>(
      () => ComunicadoDataSourceImpl(client: sl()));
}
