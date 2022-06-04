import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class InfoPendingPayment extends StatefulWidget {
  const InfoPendingPayment({Key? key}) : super(key: key);

  @override
  State<InfoPendingPayment> createState() => _InfoPendingPaymentState();
}

class _InfoPendingPaymentState extends State<InfoPendingPayment> {
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
      title: const Text("Pago Pendiente"),
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
        _buildPaymentInfoItem(),
        const SizedBox(
          height: 90,
        ),
        _buildDeleteButton(),
      ],
    );
  }

  Widget _buildPaymentInfoItem() {
    return Column(
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Center(
            child: Text(
              'Couta',
              style: headingStyle,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          _buildChargeDate(),
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: const TextSpan(
              text: 'Descripcion:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\n\nCuota del mes de Mayo',
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
              text: 'Monto:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\n\n500.00L',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ]);
  }

  Widget _buildChargeDate() {
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

  Widget _buildDeleteButton() {
    return TextButton(
      onPressed: () {
        Navigator.pushNamed(context, 'create_payment');
      },
      child: const Text(
        'Pagar',
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
