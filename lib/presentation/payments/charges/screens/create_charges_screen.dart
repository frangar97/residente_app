import 'package:flutter/material.dart';
import 'package:residente_app/presentation/payments/charges/widgets/create_charges_body.dart';

class CreateChargesScreen extends StatelessWidget {
  const CreateChargesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CreateChargesBody(),
    );
  }
}
