import 'package:flutter/material.dart';
import 'package:residente_app/presentation/payments/residents_payments/widgets/info_payment_body.dart';

class InfoPaymentsScreen extends StatelessWidget {
  const InfoPaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: InfoPaymentBody(),
    );
  }
}
