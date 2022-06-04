import 'package:flutter/material.dart';
import 'package:residente_app/presentation/incidents/widgets/incident_body.dart';

class IncidentsScreen extends StatelessWidget {
  const IncidentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: IncidentsBody(),
    );
  }
}
