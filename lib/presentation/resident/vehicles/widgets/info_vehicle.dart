import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class InfoVehicle extends StatefulWidget {
  const InfoVehicle({Key? key}) : super(key: key);

  @override
  State<InfoVehicle> createState() => _InfoVehicleState();
}

class _InfoVehicleState extends State<InfoVehicle> {
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
      title: const Text("Vehiculo"),
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
        _buildVehicleInfoItem(),
        const SizedBox(
          height: 90,
        ),
        _buildDeleteButton(),
      ],
    );
  }

  Widget _buildVehicleInfoItem() {
    return Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(
            child: Text(
              'Vehiculo',
              style: headingStyle,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: const TextSpan(
              text: 'Marca:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\n\nToyota',
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
              text: 'Modelo:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\n\nCorolla',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'Año:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\n\n2020',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
          RichText(
            text: const TextSpan(
              text: 'Placa:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\n\nHAB2469',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ]);
  }

  Widget _buildDeleteButton() {
    return TextButton(
      onPressed: () {
        // Navigator.pushNamed(context, '');
      },
      child: const Text(
        'Eliminar Vehiculo',
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
    );
  }
}
