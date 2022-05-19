import 'package:flutter/material.dart';
import 'package:residente_app/presentation/payments/charges/widgets/charges_body.dart';

class ChargesScreen extends StatelessWidget {
  const ChargesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ChargesScreenBody(),
    );
  }
}
