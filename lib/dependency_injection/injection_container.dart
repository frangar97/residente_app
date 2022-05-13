import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:residente_app/dependency_injection/register_datasources.dart';
import 'package:residente_app/dependency_injection/register_repositories.dart';

final sl = GetIt.instance;

void initializeDependencies() {
  sl.registerLazySingleton(() => http.Client());

  registerDataSources(sl);
  registerRepositories(sl);
}
