import 'package:get_it/get_it.dart';
import 'package:residente_app/features/auth/auth_repository.dart';
import 'package:residente_app/features/comunicado/comunicado_repository.dart';
import 'package:residente_app/features/encuesta/encuesta_repository.dart';
import 'package:residente_app/features/incidente/incidente_repository.dart';
import 'package:residente_app/features/reservacion/reservacion_repository.dart';
import 'package:residente_app/features/visita/visita_repository.dart';

void registerRepositories(GetIt sl) {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton<ComunicadoRepository>(
      () => ComunicadoRepositoryImpl(sl()));
  sl.registerLazySingleton<IncidenteRepository>(
      () => IncidenteRepositoryImpl(sl()));
  sl.registerLazySingleton<EncuestaRepository>(
      () => EncuestaRepositoryImpl(sl()));

  sl.registerLazySingleton<VisitaRepository>(() => VisitaRepositoryImpl(sl()));
  sl.registerLazySingleton<ReservacionRepository>(
      () => ReservacionRepositoryImpl(sl()));
}
