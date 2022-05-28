import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/comunicado/comunicado_cubit.dart';
import 'package:residente_app/features/comunicado/comunicado_model.dart';

class ReleasesBody extends StatefulWidget {
  const ReleasesBody({Key? key}) : super(key: key);

  @override
  State<ReleasesBody> createState() => _ReleasesBodyState();
}

class _ReleasesBodyState extends State<ReleasesBody> {
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
      title: const Text("Comunicados"),
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
              Navigator.pushNamed(context, "create_release");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ComunicadoCubit, ComunicadoState>(
        bloc: BlocProvider.of<ComunicadoCubit>(context)..cargarComunicados(),
        builder: ((context, state) {
          if (state.loadingComunicados) {
            return Center(
              child: Column(
                children: const [
                  CircularProgressIndicator(),
                  Text("Cargando Comunicados"),
                ],
              ),
            );
          }

          return Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Text(
                'Comunicados',
                style: subtitleStyle,
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.listaComunicados.length,
                  itemBuilder: (context, index) {
                    return _buildReleaseItem(state.listaComunicados[index]);
                  },
                ),
              ),
            ],
          );
        }));
  }

  Widget _buildReleaseItem(ComunicadoModel comunicado) {
    return BlocBuilder<ComunicadoCubit, ComunicadoState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<ComunicadoCubit>().seleccionarComunicado(comunicado);
            Navigator.pushNamed(context, 'info_release');
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
              left: 30,
              right: 30,
              top: 8,
              bottom: 10,
            ),
            child: ListTile(
                leading: const Icon(Icons.report_gmailerrorred_rounded),
                title: RichText(
                  text: TextSpan(
                    text: 'Comunicado',
                    style: subtitleStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: '\n${comunicado.descripcion}.',
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
