import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/visita/visita_cubit.dart';
import 'package:residente_app/features/visita/visita_model.dart';
import 'package:residente_app/presentation/widgets/date_time_picker.dart';
import 'package:residente_app/presentation/widgets/loading.dart';

class EventualVisit extends StatefulWidget {
  const EventualVisit({Key? key}) : super(key: key);

  @override
  State<EventualVisit> createState() => _EventualVisitState();
}

class _EventualVisitState extends State<EventualVisit> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VisitaCubit, VisitaState>(
      bloc: BlocProvider.of<VisitaCubit>(context)..cargarVisitasEventuales(),
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.grey.shade200,
          body: state.loadingVisitasEventuales
              ? const Loading(mensaje: "Cargando Visitas Eventuales")
              : ListView(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  children: [
                    Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 30,
                        ),
                        const DateTimePicker(),
                        const SizedBox(height: 30),
                        ..._buildEventualVisitItem(
                            context, state.visitasEventuales),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }

  List<Widget> _buildEventualVisitItem(
      BuildContext context, List<VisitaEventualModel> visitas) {
    return List.from(visitas.map((e) => GestureDetector(
          onTap: () {
            context.read<VisitaCubit>().seleccionarVisitaEventual(e);
            Navigator.pushNamed(context, 'info_eventual_visit');
          },
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 20,
            ),
            margin: const EdgeInsets.only(
              top: 8,
              bottom: 10,
            ),
            child: ListTile(
                leading: const Icon(Icons.three_p_outlined),
                title: Text(
                  e.nombre,
                  style: subtitleStyle,
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    RichText(
                      text: TextSpan(
                        text: 'Tipo:',
                        style: subtitleStyle,
                        children: <TextSpan>[
                          TextSpan(
                            text: '\r${e.tipoVisita.nombre}',
                            style: subtitle2Style,
                          )
                        ],
                      ),
                    ),
                    const Text(
                      'Calle A #100',
                      style: subtitleStyle,
                    )
                  ],
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                )),
          ),
        )));
  }
}
