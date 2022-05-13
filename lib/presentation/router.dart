import 'package:flutter/material.dart';
import 'package:residente_app/presentation/auth/screen/forgot_password_screen.dart';
import 'package:residente_app/presentation/auth/screen/login_screen.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    "login": (_) => const LoginScreen(),
    "forgot_password": (_) => const ForgotPasswordScreen(),
  };
}
