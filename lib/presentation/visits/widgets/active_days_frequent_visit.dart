import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:residente_app/core/utils/style_constants.dart';

class ActiveDaysFrequentVisit extends StatefulWidget {
  const ActiveDaysFrequentVisit({Key? key}) : super(key: key);

  @override
  State<ActiveDaysFrequentVisit> createState() =>
      _ActiveDaysFrequentVisitState();
}

class _ActiveDaysFrequentVisitState extends State<ActiveDaysFrequentVisit> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Activo',
          style: subtitle2Style,
        ),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Indicar Dias',
          style: subtitle2Style,
        ),
        Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          child: Column(
            children: <Widget>[
              CheckboxListTile(
                title: const Text('Lunes'),
                value: timeDilation != 1.0,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 2.0 : 1.0;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Martes'),
                value: timeDilation != 1.0,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 2.0 : 1.0;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Miercoles'),
                value: timeDilation != 1.0,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 2.0 : 1.0;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Jueves'),
                value: timeDilation != 1.0,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 2.0 : 1.0;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Viernes'),
                value: timeDilation != 1.0,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 2.0 : 1.0;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Sabado'),
                value: timeDilation != 1.0,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 2.0 : 1.0;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('Domingo'),
                value: timeDilation != 1.0,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 2.0 : 1.0;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
