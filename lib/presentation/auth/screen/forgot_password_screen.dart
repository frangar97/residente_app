import 'package:flutter/material.dart';
import 'package:residente_app/presentation/auth/widgets/forgot_password_body.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: ForgotPasswordBody()),
    );
  }
}
