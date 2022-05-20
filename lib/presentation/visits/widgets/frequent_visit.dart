import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/widgets/date_time_picker.dart';

class FrequentVisit extends StatefulWidget {
  const FrequentVisit({Key? key}) : super(key: key);

  @override
  State<FrequentVisit> createState() => _FrequentVisitState();
}

class _FrequentVisitState extends State<FrequentVisit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: ListView(
        padding: const EdgeInsets.only(left: 30, right: 30),
        children: [
          Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const DateTimePicker(),
              const SizedBox(height: 30),
              _buildFrequentVisitItem(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFrequentVisitItem() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'info_frequent_visit');
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
          top: 8,
          bottom: 10,
        ),
        child: ListTile(
            leading: const Icon(Icons.three_p_rounded),
            title: const Text(
              'Eduardo Suarez',
              style: subtitleStyle,
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                RichText(
                  text: const TextSpan(
                    text: 'Tipo:',
                    style: subtitleStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: '\rFamiliar',
                        style: subtitle2Style,
                      )
                    ],
                  ),
                ),
                const Text(
                  'Calle A #100',
                  style: subtitleStyle,
                )
              ],
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            )),
      ),
    );
  }
}
