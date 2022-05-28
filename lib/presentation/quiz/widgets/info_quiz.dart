import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/encuesta/encuesta_cubit.dart';

class InfoQuiz extends StatefulWidget {
  const InfoQuiz({Key? key}) : super(key: key);

  @override
  State<InfoQuiz> createState() => _InfoQuizState();
}

class _InfoQuizState extends State<InfoQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      title: const Text("Encuesta"),
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
    );
  }

  Widget _buildBody() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        const SizedBox(height: 30),
        _buildQuizInfoItem(),
      ],
    );
  }

  Widget _buildQuizInfoItem() {
    return BlocBuilder<EncuestaCubit, EncuestaState>(
      builder: (context, state) {
        final encuesta = state.encuestaSelected!;

        return Column(
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              encuesta.titulo,
              style: headingStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            _buildQuizDate(encuesta.fecha),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60),
              child: RichText(
                text: TextSpan(
                  text: 'Descripcion:',
                  style: subtitle2Style,
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n\n${encuesta.descripcion}.',
                      style: subtitleStyle,
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 60, right: 60),
              child: RichText(
                text: TextSpan(
                  text: 'Link:',
                  style: subtitle2Style,
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n\n${encuesta.link}',
                      style: subtitleStyle,
                    )
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildQuizDate(String fecha) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RichText(
          text: TextSpan(
            text: 'Fecha:',
            style: subtitle2Style,
            children: <TextSpan>[
              TextSpan(
                text: '\r$fecha',
                style: subtitle2Style,
              )
            ],
          ),
        ),
      ],
    );
  }
}
