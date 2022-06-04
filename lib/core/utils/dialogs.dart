import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

Future showWarningPanicAlert(context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        insetPadding: const EdgeInsets.all(70),
        title: Column(
          children: const [
            Icon(
              Icons.report_gmailerrorred_rounded,
              color: Colors.red,
              size: 25,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        content: const Text(
          '¿Estas seguro de enviar una alerta de panico a la caseta?',
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'No',
                style: subtitle2Style,
              )),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Si',
                style: subtitle2Style,
              ))
        ],
      );
    },
  );
}
