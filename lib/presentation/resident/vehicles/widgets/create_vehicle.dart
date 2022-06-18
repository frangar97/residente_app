import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class CreateVehicle extends StatefulWidget {
  const CreateVehicle({Key? key}) : super(key: key);

  @override
  State<CreateVehicle> createState() => _CreateVehicleState();
}

class _CreateVehicleState extends State<CreateVehicle> {
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
      title: const Text("Agregar Vehiculo"),
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
        children: [
          Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'Vehiculo',
                  style: subtitleStyle,
                ),
                const SizedBox(
                  height: 30,
                ),
                _buildBrandFormField(),
                const SizedBox(
                  height: 30,
                ),
                _buildModelFormField(),
                const SizedBox(
                  height: 30,
                ),
                _buildYearFormField(),
                const SizedBox(
                  height: 30,
                ),
                _buildPlateFormField(),
                const SizedBox(
                  height: 90,
                ),
                _buildCenerateReservationButton(),
              ],
            ),
          ),
        ]);
  }

  Widget _buildBrandFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Marca',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildModelFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Modelo',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildYearFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Año',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildPlateFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Placa',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildCenerateReservationButton() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Agregar Vehiculo',
        style: textButtonStyle,
      ),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width, 40),
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
