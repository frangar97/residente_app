import 'package:get_it/get_it.dart';
import 'package:residente_app/features/auth/auth_datasource.dart';

void registerDataSources(GetIt sl) {
  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(client: sl()));
}
