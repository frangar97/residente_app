import 'package:flutter/material.dart';
import 'package:residente_app/presentation/wallet/expenses/widgets/expenses_body.dart';

class ExpensesScreen extends StatelessWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ExpensesBody(),
    );
  }
}
