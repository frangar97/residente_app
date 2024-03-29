import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/comunicado/comunicado_cubit.dart';

class InfoRelease extends StatefulWidget {
  const InfoRelease({Key? key}) : super(key: key);

  @override
  State<InfoRelease> createState() => _InfoReleaseState();
}

class _InfoReleaseState extends State<InfoRelease> {
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
      title: const Text("Comunicado"),
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
        _buildReleaseInfoItem(),
      ],
    );
  }

  Widget _buildReleaseInfoItem() {
    return BlocBuilder<ComunicadoCubit, ComunicadoState>(
      builder: (context, state) {
        final comunicado = state.comunicadoSelected!;
        return Column(
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Comunicado',
              style: headingStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            _buildReleaseDate(comunicado.fecha),
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
                      text: '\n\n${comunicado.descripcion}',
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

  Widget _buildReleaseDate(String fecha) {
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
