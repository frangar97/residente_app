import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/widgets/date_time_picker.dart';

class PendingPayment extends StatefulWidget {
  const PendingPayment({Key? key}) : super(key: key);

  @override
  State<PendingPayment> createState() => _PendingPaymentState();
}

class _PendingPaymentState extends State<PendingPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        padding: const EdgeInsets.only(
          left: 30,
          right: 30,
        ),
        children: [
          Column(
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
        ],
      ),
    );
  }

  Widget _buildPaymentItem() {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "info_pending_payment");
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: Colors.white),
          padding:
              const EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          margin: const EdgeInsets.only(
            top: 8,
            bottom: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
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
              const Text(
                '|',
                style: subtitleStyle,
              ),
              const Text(
                '500.00L',
                style: subtitleStyle,
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                color: Colors.black,
              )
            ],
          ),
        ));
  }

  Widget _buildCountItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
      margin: const EdgeInsets.only(
        top: 8,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          RichText(
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
          const Text(
            '|',
            style: subtitleStyle,
          ),
          const Text(
            '500.00L',
            style: subtitleStyle,
          ),
        ],
      ),
    );
  }
}
