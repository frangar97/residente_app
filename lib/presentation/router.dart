import 'package:flutter/material.dart';
import 'package:residente_app/presentation/admin/screen/admin_home_screen.dart';
import 'package:residente_app/presentation/auth/screen/forgot_password_screen.dart';
import 'package:residente_app/presentation/auth/screen/login_screen.dart';
import 'package:residente_app/presentation/payments/charges/screens/charges_screen.dart';
import 'package:residente_app/presentation/payments/residents_payments/screens/info_payment_screen.dart';
import 'package:residente_app/presentation/payments/residents_payments/screens/residents_payments_screen.dart';

Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    "auth_login": (_) => const LoginScreen(),
    "auth_forgot_password": (_) => const ForgotPasswordScreen(),
    "admin_home": (_) => const AdminHomeScreen(),
    "payments_charges": (_) => const ChargesScreen(),
    "payments_resident_info": (_) => const InfoPaymentsScreen(),
    "payments_resident_payment": (_) => const ResidentsPaymentsScreen(),
  };
}
