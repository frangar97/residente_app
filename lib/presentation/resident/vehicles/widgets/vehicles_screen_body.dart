import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class VehiclesScreenBody extends StatefulWidget {
  const VehiclesScreenBody({Key? key}) : super(key: key);

  @override
  State<VehiclesScreenBody> createState() => _VehiclesScreenBodyState();
}

class _VehiclesScreenBodyState extends State<VehiclesScreenBody> {
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
          children: [
            _buildVehicleItem(),
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
      title: const Text("Vehiculos"),
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
              Navigator.pushNamed(context, "create_vehicle");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildVehicleItem() {
    return GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "info_vehicle");
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
                  text: 'Toyota',
                  style: subtitleStyle,
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nCorolla 2020',
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
                'HAB2469',
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
}
