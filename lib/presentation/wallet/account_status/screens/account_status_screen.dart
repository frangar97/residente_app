import 'package:flutter/material.dart';
import 'package:residente_app/presentation/wallet/account_status/widgets/account_status_body.dart';

class AccountStatusScreen extends StatelessWidget {
  const AccountStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AccountStatusBody(),
    );
  }
}
