import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  final String mensaje;
  const Loading({Key? key, required this.mensaje}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        CircularProgressIndicator(
          color: Colors.orange.shade600,
        ),
        Text(mensaje)
      ]),
    );
  }
}
