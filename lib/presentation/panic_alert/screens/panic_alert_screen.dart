import 'package:flutter/material.dart';
import 'package:residente_app/presentation/panic_alert/widgets/panic_alert_body.dart';

class PanicAlertScreen extends StatelessWidget {
  const PanicAlertScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: PanicAlertBody());
  }
}
