import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/widgets/date_time_picker.dart';

class PaymentsStatus extends StatefulWidget {
  const PaymentsStatus({Key? key}) : super(key: key);

  @override
  State<PaymentsStatus> createState() => _PaymentsStatusState();
}

class _PaymentsStatusState extends State<PaymentsStatus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const DateTimePicker(),
          const SizedBox(height: 30),
          _buildCountItem(),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
            height: 30,
            endIndent: 80,
            indent: 80,
            thickness: 1,
          ),
          const SizedBox(height: 10),
          _buildPaymentItem(),
        ],
      ),
    );
  }

  Widget _buildPaymentItem() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, "payments_resident_info");
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: 20,
        ),
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
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
                    text: '\nCalle A #100',
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
                    text: '\r\r\r\r\r\r\r\r500.00L',
                    style: subtitleStyle,
                  )
                ],
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _buildCountItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      padding: const EdgeInsets.only(
        top: 8,
        bottom: 8,
        left: 20,
      ),
      margin: const EdgeInsets.only(
        left: 30,
        right: 30,
        top: 8,
        bottom: 10,
      ),
      child: ListTile(
        leading: RichText(
          text: const TextSpan(
            text: 'Total',
            style: subtitleStyle,
            children: <TextSpan>[
              TextSpan(
                text: '(1)',
                style: subtitle2Style,
              )
            ],
          ),
        ),
        title: RichText(
          text: const TextSpan(
            text: '\r\r\r\r\r\r\r\r\r|',
            style: subtitleStyle,
            children: <TextSpan>[
              TextSpan(
                text: '\r\r\r\r\r\r\r\r\r\r500.00L',
              )
            ],
          ),
        ),
      ),
    );
  }
}
