import 'package:flutter/material.dart';
import 'package:residente_app/presentation/payments/residents_payments/widgets/residents_payments_body.dart';

class ResidentsPaymentsScreen extends StatelessWidget {
  const ResidentsPaymentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ResidentsPaymentsBody(),
    );
  }
}
