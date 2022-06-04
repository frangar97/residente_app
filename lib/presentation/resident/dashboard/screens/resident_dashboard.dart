import 'package:flutter/material.dart';
import 'package:residente_app/presentation/resident/dashboard/widgets/resident_dashboard_body.dart';

class ResidentDashboard extends StatelessWidget {
  const ResidentDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ResidentDashboardBody(),
    );
  }
}
