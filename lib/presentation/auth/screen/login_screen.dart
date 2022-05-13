import 'package:flutter/material.dart';
import 'package:residente_app/presentation/auth/widgets/login_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: LoginBody()),
    );
  }
}
