import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/incidente/incidente_cubit.dart';

class InfoIncidet extends StatefulWidget {
  const InfoIncidet({Key? key}) : super(key: key);

  @override
  State<InfoIncidet> createState() => _InfoIncidetState();
}

class _InfoIncidetState extends State<InfoIncidet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildAppBar(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return BlocBuilder<IncidenteCubit, IncidenteState>(
      builder: (context, state) {
        return AppBar(
          flexibleSpace: Container(
              decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
          elevation: 0,
          centerTitle: true,
          title: Text(state.incidenteSelected!.titulo),
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
      },
    );
  }

  Widget _buildBody() {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        const SizedBox(height: 30),
        _buildIncidentInfoItem(),
        const SizedBox(height: 30),
        _buildAttachedFile(),
        const SizedBox(height: 20),
        const Divider(
          color: Colors.black,
          height: 30,
          endIndent: 130,
          indent: 130,
          thickness: 1,
        ),
        const SizedBox(height: 30),
        _buildNoteFormField(),
        const SizedBox(height: 60),
        _buildDeleteSendButtons(),
        const SizedBox(height: 20)
      ],
    );
  }

  Widget _buildIncidentInfoItem() {
    return BlocBuilder<IncidenteCubit, IncidenteState>(
      builder: (context, state) {
        final incidente = state.incidenteSelected!;
        return Column(
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              incidente.titulo,
              style: headingStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            _buildIncidentDate(incidente.fecha),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                text: 'Lugar: ',
                style: subtitle2Style,
                children: <TextSpan>[
                  TextSpan(
                    text: incidente.lugar,
                    style: subtitle2Style,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RichText(
                text: TextSpan(
                  text: 'Descripcion:',
                  style: subtitle2Style,
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n\n${incidente.descripcion}',
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

  Widget _buildIncidentDate(String fecha) {
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

  Widget _buildAttachedFile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text(
          'Archivo adjunto:',
          style: subtitle2Style,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.09,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              fit: BoxFit.fill,
              alignment: Alignment.topRight,
              image: NetworkImage(
                'https://www.netjet.es/wp-content/uploads/2019/12/Cuales-son-las-causas-de-las-fugas-en-las-tuber%C3%ADas_v3-666x333.jpg',
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 60.0, bottom: 10),
          child: Text(
            'Nota de Revisión:',
            style: subtitle2Style,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintStyle: subtitle2Style,
              hintText: 'Nota',
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(20),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeleteSendButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Eliminar',
            style: subtitleStyle,
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              const Size(140, 40),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.grey.shade300,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Enviar',
            style: textButtonStyle,
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              const Size(140, 40),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.orange.shade600,
            ),
          ),
        ),
      ],
    );
  }
}
