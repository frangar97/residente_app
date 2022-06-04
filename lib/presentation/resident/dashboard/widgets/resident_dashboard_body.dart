import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class ResidentDashboardBody extends StatefulWidget {
  const ResidentDashboardBody({Key? key}) : super(key: key);

  @override
  State<ResidentDashboardBody> createState() => _ResidentDashboardBodyState();
}

class _ResidentDashboardBodyState extends State<ResidentDashboardBody> {
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
      title: const Text("Calle A #100"),
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
            Navigator.pushNamed(context, 'resident_menu');
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return ListView(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 50),
              const Text(
                'Calle A #100',
                style: headingStyle,
              ),
              const SizedBox(height: 50),
              _buildPaymentInfoItem(),
              const SizedBox(height: 50),
              const Divider(
                color: Colors.black,
                height: 30,
                endIndent: 130,
                indent: 130,
                thickness: 1,
              ),
              const SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildPendingPayment(),
                  _buildAprovedPayment(),
                ],
              ),
            ],
          ),
        ]);
  }

  Widget _buildPaymentInfoItem() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'payments');
      },
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(
            top: 8,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: RichText(
                      text: const TextSpan(
                          text: 'Pagos',
                          style: subtitleStyle,
                          children: <TextSpan>[
                    TextSpan(
                      text: ' \rPendientes',
                      style: subtitle2Style,
                    )
                  ]))),
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  '0',
                  style: heading2Style,
                ),
              ),
              const SizedBox(height: 20),
              const Divider(
                color: Colors.black,
                height: 30,
                endIndent: 80,
                indent: 80,
                thickness: 1,
              ),
              const SizedBox(height: 20),
              _buildPaymentAccount(),
            ],
          )),
    );
  }

  Widget _buildPaymentAccount() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Center(
          child: RichText(
            overflow: TextOverflow.clip,
            textAlign: TextAlign.center,
            text: const TextSpan(
              text: 'Cuenta de Pago:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: '\n\nBANCO FICOHSA - 123456789',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPendingPayment() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'payments');
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(2, 4),
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Icon(
                  Icons.pending_actions,
                  color: Colors.blue,
                ),
                SizedBox(height: 20),
                Text(
                  '0.00L',
                  style: headingStyle,
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 20),
                Text(
                  'Pendiente',
                  style: subtitle2Style,
                  overflow: TextOverflow.ellipsis,
                )
              ])),
    );
  }

  Widget _buildAprovedPayment() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'payments');
      },
      child: Container(
          width: MediaQuery.of(context).size.width * 0.4,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 1,
              offset: const Offset(2, 4),
            ),
          ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.access_time,
                  color: Colors.blue,
                ),
                SizedBox(height: 20),
                Text(
                  '0.00L',
                  style: headingStyle,
                  overflow: TextOverflow.visible,
                ),
                SizedBox(height: 20),
                Text(
                  'Por Aprobar',
                  style: subtitle2Style,
                  overflow: TextOverflow.ellipsis,
                )
              ])),
    );
  }
}
