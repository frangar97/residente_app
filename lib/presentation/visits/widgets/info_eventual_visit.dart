import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

class InfoEventualVisit extends StatefulWidget {
  const InfoEventualVisit({
    Key? key,
  }) : super(key: key);

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
      padding: const EdgeInsets.only(left: 30, right: 30),
      shrinkWrap: true,
      children: <Widget>[
        const SizedBox(height: 30),
        _buildFrequentVisitInfoItem(),
        const SizedBox(height: 60),
        _buildQrCode(),
        const SizedBox(height: 70),
        _buildReceiveButtons(),
      ],
    );
  }

  Widget _buildFrequentVisitInfoItem() {
    return Column(
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
    );
  }

  Widget _buildQrCode() {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              backgroundColor: Colors.grey.shade200,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: const Center(child: Text("Compartir:")),
              content: _buildWhatsAppShare(),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text(
                    "Ok",
                    style: subtitleStyle,
                  ),
                ),
              ],
              actionsPadding: EdgeInsets.zero,
            ),
          );
        },
        child: Center(
          child: QrImage(
            data: '',
            version: QrVersions.auto,
            size: 320,
          ),
        ));
  }

  Widget _buildWhatsAppShare() {
    return Container(
      margin: const EdgeInsets.only(left: 80, right: 80),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomCenter,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          fit: BoxFit.scaleDown,
          image: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/WhatsApp_logo-color-vertical.svg/2048px-WhatsApp_logo-color-vertical.svg.png',
          ),
        ),
      ),
    );
  }

  Widget _buildReceiveButtons() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Recibir',
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
    );
  }
}
