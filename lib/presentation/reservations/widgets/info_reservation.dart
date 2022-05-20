import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class InfoReservation extends StatefulWidget {
  const InfoReservation({Key? key}) : super(key: key);

  @override
  State<InfoReservation> createState() => _InfoReservationState();
}

class _InfoReservationState extends State<InfoReservation> {
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
      title: const Text("Reservacion"),
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
        _buildReservationInfoItem(),
        const SizedBox(
          height: 80,
        ),
        _buildAprovedRejectButtons(),
      ],
    );
  }

  Widget _buildReservationInfoItem() {
    return Column(
      verticalDirection: VerticalDirection.down,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Calle A #100',
          style: headingStyle,
        ),
        const SizedBox(
          height: 30,
        ),
        _buildReservationDate(),
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: RichText(
            text: const TextSpan(
              text: 'Lugar:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\n\nQuiosco, Parque Calle A, Residencial Toledo',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ),
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
                      '\n\nHola, necesito reservar el quiosco del parquecito de la calle A el dia martes de la proxima semana, por dos horas, es para un kermes de mi hijo.',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReservationDate() {
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

  Widget _buildAprovedRejectButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Rechazar',
            style: subtitleStyle,
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
                bottom: 10,
              ),
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
            'Aprobar',
            style: subtitleStyle,
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 10,
                bottom: 10,
              ),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.yellow.shade600,
            ),
          ),
        ),
      ],
    );
  }
}
