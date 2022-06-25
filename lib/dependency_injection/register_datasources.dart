import 'package:get_it/get_it.dart';
import 'package:residente_app/features/auth/auth_datasource.dart';
import 'package:residente_app/features/comunicado/comunicado_datasource.dart';
import 'package:residente_app/features/encuesta/encuesta_datasource.dart';
import 'package:residente_app/features/incidente/incidente_datasource.dart';
import 'package:residente_app/features/reservacion/reservacion_datasource.dart';
import 'package:residente_app/features/visita/visita_datasource.dart';

void registerDataSources(GetIt sl) {
  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(client: sl()));

  sl.registerLazySingleton<ComunicadoDataSource>(
      () => ComunicadoDataSourceImpl(client: sl()));

  sl.registerLazySingleton<IncidenteDataSource>(
      () => IncidenteDataSourceImpl(client: sl()));

  sl.registerLazySingleton<EncuestaDataSource>(
      () => EncuestaDataSourceImpl(client: sl()));

  sl.registerLazySingleton<VisitaDataSource>(
      () => VisitaDataSourceImpl(client: sl()));

  sl.registerLazySingleton<ReservacionDataSource>(
      () => ReservacionDataSourceImpl(client: sl()));
}
