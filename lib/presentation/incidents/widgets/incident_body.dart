import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/incidente/incidente_cubit.dart';
import 'package:residente_app/features/incidente/incidente_model.dart';

class IncidentsBody extends StatefulWidget {
  const IncidentsBody({Key? key}) : super(key: key);

  @override
  State<IncidentsBody> createState() => _IncidentsBodyState();
}

class _IncidentsBodyState extends State<IncidentsBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildAppBar(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
      elevation: 0,
      centerTitle: true,
      title: const Text("Incidentes/Quejas"),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.orange.shade800,
        ),
        margin: const EdgeInsets.all(8),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 25,
          ),
          tooltip: 'Atras',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "create_incident");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<IncidenteCubit, IncidenteState>(
      bloc: BlocProvider.of<IncidenteCubit>(context)..cargarIncidentes(),
      builder: (context, state) {
        if (state.loadingIncidentes) {
          return Center(
            child: Column(children: const [
              CircularProgressIndicator(),
              Text("Cargando Incidentes")
            ]),
          );
        }

        return ListView(
            padding: const EdgeInsets.only(left: 30, right: 30),
            children: [
              Column(
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Incidentes/Quejas',
                    style: subtitleStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.listaIncidentes.length,
                      itemBuilder: (context, index) {
                        return _buildIncidentItem(state.listaIncidentes[index]);
                      },
                    ),
                  ]),
                ],
              ),
            ]);
      },
    );
  }

  Widget _buildIncidentItem(IncidenteModel incidente) {
    return BlocBuilder<IncidenteCubit, IncidenteState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<IncidenteCubit>().seleccionarIncidente(incidente);
            Navigator.pushNamed(context, 'info_incidents');
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
                leading: const Icon(Icons.warning_amber_rounded),
                title: RichText(
                  text: TextSpan(
                    text: incidente.titulo,
                    style: subtitleStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n${incidente.descripcion}',
                        style: subtitle2Style,
                      )
                    ],
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                )),
          ),
        );
      },
    );
  }
}
