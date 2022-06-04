import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/encuesta/encuesta_cubit.dart';
import 'package:residente_app/features/encuesta/encuesta_model.dart';
import 'package:residente_app/presentation/widgets/loading.dart';

class QuizBody extends StatefulWidget {
  const QuizBody({Key? key}) : super(key: key);

  @override
  State<QuizBody> createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildAppBar(context),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
      elevation: 0,
      centerTitle: true,
      title: const Text("Encuestas"),
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
              context.read<EncuestaCubit>().resetearCreacion();
              Navigator.pushNamed(context, "create_quiz");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return BlocBuilder<EncuestaCubit, EncuestaState>(
      bloc: BlocProvider.of<EncuestaCubit>(context)..cargarEncuestas(),
      builder: (context, state) {
        if (state.loadingEncuestas) {
          return const Loading(mensaje: "Cargando Encuestas");
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
                    'Encuestas',
                    style: subtitleStyle,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Column(children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.listaEncuestas.length,
                      itemBuilder: (context, index) {
                        return _buildIncidentItem(
                            context, state.listaEncuestas[index]);
                      },
                    ),
                  ]),
                ],
              ),
            ]);
      },
    );
  }

  Widget _buildIncidentItem(BuildContext context, EncuestaModel encuesta) {
    return GestureDetector(
      onTap: () {
        context.read<EncuestaCubit>().seleccionarEncuesta(encuesta);
        Navigator.pushNamed(context, 'info_quiz');
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
            leading: const Icon(Icons.quiz),
            title: RichText(
              text: TextSpan(
                text: encuesta.titulo,
                style: subtitleStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: '\n${encuesta.descripcion}.',
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
  }
}
