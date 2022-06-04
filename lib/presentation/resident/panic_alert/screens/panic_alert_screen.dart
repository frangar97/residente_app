import 'package:flutter/material.dart';
import 'package:residente_app/presentation/resident/panic_alert/widgets/panic_alert_body.dart';

class PanicAlert extends StatelessWidget {
  const PanicAlert({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: PanicAlertBody(),
    );
  }
}
