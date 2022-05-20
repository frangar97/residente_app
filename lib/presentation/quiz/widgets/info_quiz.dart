import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

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
      backgroundColor: Colors.black87,
      elevation: 0,
      centerTitle: true,
      title: const Text("Encuesta"),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.yellow.shade600,
        ),
        margin: const EdgeInsets.all(8),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
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
    return Column(
      verticalDirection: VerticalDirection.down,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Encuesta',
          style: headingStyle,
        ),
        const SizedBox(
          height: 30,
        ),
        _buildQuizDate(),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: RichText(
            text: const TextSpan(
              text: 'Descripcion:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text:
                      '\n\nEsta encuesta es para crear el analisis necesario para la puesta de postes solares.',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30, left: 60, right: 60),
          child: RichText(
            text: const TextSpan(
              text: 'Link:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\n\nhttps://quizizz.com/?fromBrowserLoad=true',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuizDate() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RichText(
          text: const TextSpan(
            text: 'Fecha:',
            style: subtitle2Style,
            children: <TextSpan>[
              TextSpan(
                text: '\r01/05/2022',
                style: subtitle2Style,
              )
            ],
          ),
        ),
      ],
    );
  }
}
