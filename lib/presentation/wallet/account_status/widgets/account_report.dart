import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class AccountReport extends StatefulWidget {
  const AccountReport({Key? key}) : super(key: key);

  @override
  State<AccountReport> createState() => _AccountReportState();
}

class _AccountReportState extends State<AccountReport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
      child: ListView(
        children: <Widget>[
          _buildLogo(),
          Center(
              child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: 'Agosto 2022',
                      style: subtitleStyle,
                      children: <TextSpan>[
                        TextSpan(
                          text: '\nRESUMEN DE MOVIMIENTOS',
                          style: subtitle2Style,
                        )
                      ]))),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'Saldo Inicial',
                style: subtitleStyle,
              ),
              Text(
                '0.00L',
                style: subtitle2Style,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          accountDivider,
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Ingresos',
            style: subtitleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          accountDivider,
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'Cuota',
                style: subtitleStyle,
              ),
              Text(
                '5,000.00L',
                style: subtitle2Style,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'Total Ingresos',
                style: subtitleStyle,
              ),
              Text(
                '5,000.00L',
                style: subtitle2Style,
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          accountDivider,
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Gastos',
            style: subtitleStyle,
          ),
          const SizedBox(
            height: 10,
          ),
          accountDivider,
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'Luz',
                style: subtitleStyle,
              ),
              Text(
                '3,000.00L',
                style: subtitle2Style,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'Agua',
                style: subtitleStyle,
              ),
              Text(
                '1,000.00L',
                style: subtitle2Style,
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'Total Gastos',
                style: subtitleStyle,
              ),
              Text(
                '4,000.00L',
                style: subtitle2Style,
              )
            ],
          ),
          accountDivider,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                'Saldo',
                style: subtitleStyle,
              ),
              Text(
                '1,000.00L',
                style: subtitle2Style,
              )
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.4,
      margin: const EdgeInsets.only(
        top: 30,
        bottom: 10,
      ),
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.contain,
          alignment: Alignment.bottomCenter,
          image: NetworkImage(
              'https://www.grupowhn.com/images/residencial%20toledo%20logo.png?crc=444117020'),
        ),
      ),
    );
  }
}
