import 'package:flutter/material.dart';
import 'package:residente_app/presentation/resident/payments/widgets/payments_body.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PaymentsBody(),
    );
  }
}
