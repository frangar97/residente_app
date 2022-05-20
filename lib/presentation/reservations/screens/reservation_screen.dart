import 'package:flutter/material.dart';
import 'package:residente_app/presentation/reservations/widgets/reservation_body.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ReservationBody(),
    );
  }
}
