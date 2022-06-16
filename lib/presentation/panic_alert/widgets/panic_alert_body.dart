import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class PanicAlertBody extends StatefulWidget {
  PanicAlertBody({Key? key}) : super(key: key);

  @override
  State<PanicAlertBody> createState() => _PanicAlertBodyState();
}

class _PanicAlertBodyState extends State<PanicAlertBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildAppBar(),
      ),
      body: ListView(padding: const EdgeInsets.all(30), children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildPanicButton(),
            const Text(
              'Presiona el boton para enviar la alerta a la caseta de guardias!',
              style: subtitle2Style,
            )
          ],
        ),
      ]),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
      elevation: 0,
      centerTitle: true,
      title: const Text("Alerta de Panico"),
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

  Widget _buildPanicButton() {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              backgroundColor: Colors.grey.shade200,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              title: const Center(
                child: Text(
                  "¿Estás seguro de enviar la alerta a la caseta de guardias?",
                  style: subtitleStyle,
                ),
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Center(
                    child: Text(
                      "Enviar",
                      style: subtitleStyle,
                    ),
                  ),
                ),
              ],
              actionsPadding: EdgeInsets.zero,
            ),
          );
        },
        child: const CircleAvatar(
          backgroundColor: Colors.white,
          radius: 340,
          child: Icon(
            Icons.circle,
            color: Colors.red,
            size: 300,
          ),
        ));
  }
}
