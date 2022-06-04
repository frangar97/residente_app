import 'package:flutter/material.dart';
import 'package:residente_app/presentation/visits/widgets/visits_body.dart';

class VisitsScreen extends StatelessWidget {
  const VisitsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: VisitsBody());
  }
}
