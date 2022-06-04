import 'package:flutter/material.dart';
import 'package:residente_app/presentation/resident/vehicles/widgets/vehicles_screen_body.dart';

class VehiclesScreen extends StatelessWidget {
  const VehiclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: VehiclesScreenBody(),
    );
  }
}
