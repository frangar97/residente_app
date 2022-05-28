import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class ChargesScreenBody extends StatefulWidget {
  const ChargesScreenBody({Key? key}) : super(key: key);

  @override
  State<ChargesScreenBody> createState() => _ChargesScreenBodyState();
}

class _ChargesScreenBodyState extends State<ChargesScreenBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      title: const Text("Generar Cargos"),
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
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "payments_create_charges");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return ListView(
      padding: const EdgeInsets.only(left: 30, right: 30),
      children: <Widget>[
        Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Cargos',
              style: subtitleStyle,
            ),
            const SizedBox(
              height: 15,
            ),
            Column(children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  return _buildChargeItem();
                },
              ),
            ]),
          ],
        ),
      ],
    );
  }

  Widget _buildChargeItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 20,
      ),
      margin: const EdgeInsets.only(
        top: 8,
        bottom: 10,
      ),
      child: ListTile(
          leading: RichText(
            text: const TextSpan(
              text: 'Cuota',
              style: subtitleStyle,
              children: <TextSpan>[
                TextSpan(
                  text: ' \nMayo 2022',
                  style: subtitle2Style,
                )
              ],
            ),
          ),
          title: RichText(
            text: const TextSpan(
              text: '\r\r\r|',
              style: subtitleStyle,
              children: <TextSpan>[
                TextSpan(
                  text: '\r\r\r\r\r\r\r500.00L',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          )),
    );
  }
}
