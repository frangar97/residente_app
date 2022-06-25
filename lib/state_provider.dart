import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/cubits/auth/auth_cubit.dart';
import 'package:residente_app/cubits/comunicado/comunicado_cubit.dart';
import 'package:residente_app/cubits/encuesta/encuesta_cubit.dart';
import 'package:residente_app/cubits/incidente/incidente_cubit.dart';
import 'package:residente_app/cubits/reservacion/reservacion_cubit.dart';
import 'package:residente_app/cubits/visita/visita_cubit.dart';
import "package:residente_app/dependency_injection/injection_container.dart"
    as di;

class StateProvider extends StatelessWidget {
  final Widget child;
  const StateProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => AuthCubit(authRepository: di.sl())),
      BlocProvider(
          create: (_) => ComunicadoCubit(comunicadoRepository: di.sl())),
      BlocProvider(create: (_) => IncidenteCubit(incidenteRepository: di.sl())),
      BlocProvider(create: (_) => EncuestaCubit(encuestaRepository: di.sl())),
      BlocProvider(create: (_) => VisitaCubit(visitaRepository: di.sl())),
      BlocProvider(
          create: (_) => ReservacionCubit(reservacionRepository: di.sl())),
    ], child: child);
  }
}
