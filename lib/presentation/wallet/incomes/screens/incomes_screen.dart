import 'package:flutter/material.dart';
import 'package:residente_app/presentation/wallet/incomes/widgets/incomes_body.dart';

class IncomesScreen extends StatelessWidget {
  const IncomesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: IncomesBody(),
    );
  }
}
