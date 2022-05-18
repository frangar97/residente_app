import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/cubits/auth/auth_cubit.dart';
import "package:residente_app/dependency_injection/injection_container.dart"
    as di;

class StateProvider extends StatelessWidget {
  final Widget child;
  const StateProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => AuthCubit(authRepository: di.sl()))
    ], child: child);
  }
}