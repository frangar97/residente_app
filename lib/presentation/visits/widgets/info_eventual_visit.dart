import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class InfoEventualVisit extends StatefulWidget {
  const InfoEventualVisit({Key? key}) : super(key: key);

  @override
  State<InfoEventualVisit> createState() => _InfoEventualVisitState();
}

class _InfoEventualVisitState extends State<InfoEventualVisit> {
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
      title: const Text("Visita Eventual"),
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
        _buildFrequentVisitInfoItem(),
        const SizedBox(height: 60),
        _buildQrCode(),
        const SizedBox(height: 70),
        _buildAprovedRejectButtons(),
      ],
    );
  }

  Widget _buildFrequentVisitInfoItem() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // verticalDirection: VerticalDirection.down,
        children: <Widget>[
          const Center(
            child: Text(
              'Uber Eats',
              style: headingStyle,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: const TextSpan(
              text: 'Tipo:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\r Servicio a Domicilio',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: const TextSpan(
              text: 'Fecha/Hora Entrada:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\r20/05/2022 - 9:00am',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: const TextSpan(
              text: 'Nota:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\rAlimentos.',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQrCode() {
    return Container(
      margin: const EdgeInsets.only(left: 110, right: 110),
      alignment: Alignment.topCenter,
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          alignment: Alignment.topRight,
          image: NetworkImage(
            'https://qrcode.tec-it.com/API/QRCode?data=smsto%3A555-555-5555%3AGenerador+de+C%C3%B3digos+QR+de+TEC-IT',
          ),
        ),
      ),
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
            style: textButtonStyle,
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
              Colors.orange.shade600,
            ),
          ),
        ),
      ],
    );
  }
}
