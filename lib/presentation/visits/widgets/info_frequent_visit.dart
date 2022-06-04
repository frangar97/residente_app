import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class InfoFrequentVisit extends StatefulWidget {
  const InfoFrequentVisit({Key? key}) : super(key: key);

  @override
  State<InfoFrequentVisit> createState() => _InfoFrequentVisitState();
}

class _InfoFrequentVisitState extends State<InfoFrequentVisit> {
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
      title: const Text("Visita Frequente"),
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
        _buildAttachedFile(),
        const SizedBox(height: 30),
        _buildFrequentVisitInfoItem(),
        const SizedBox(height: 90),
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
              'Eduardo Suarez',
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
                  text: '\r Familiar',
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
              text: 'Dias:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\rLunes, Martes, Miercoles, Jueves, Viernes',
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
                  text: '\rViene a cuidar a mi bebe.',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachedFile() {
    return CircleAvatar(
      maxRadius: 75,
      backgroundColor: Colors.grey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Image.network(
          'https://www.rutanmedellin.org/images/1pruebas/foto-persona.jpg',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Text('Sin foto');
          },
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
