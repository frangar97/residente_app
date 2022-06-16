import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/widgets/date_time_picker.dart';

class CreateChargesBody extends StatefulWidget {
  const CreateChargesBody({Key? key}) : super(key: key);

  @override
  State<CreateChargesBody> createState() => _CreateChargesBodyState();
}

class _CreateChargesBodyState extends State<CreateChargesBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
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
      title: const Text("Generar Cargo"),
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
                  'Cargo',
                  style: subtitleStyle,
                ),
                const SizedBox(
                  height: 30,
                ),
                _buildApplyCharge(),
                const SizedBox(
                  height: 30,
                ),
                _buildTypeCharge(),
                const SizedBox(
                  height: 30,
                ),
                const DateTimePicker(),
                const SizedBox(
                  height: 30,
                ),
                const DateTimePicker(),
                const SizedBox(
                  height: 30,
                ),
                _buildAmountFormField(),
                const SizedBox(
                  height: 30,
                ),
                _buildNoteFormField(),
                const SizedBox(
                  height: 50,
                ),
                _buildCenerateFeeButton(),
              ],
            ),
          ),
        ]);
  }

  Widget _buildApplyCharge() {
    String dropdownValue = 'Residencial';
    return Container(
        padding: const EdgeInsets.only(
          left: 95,
          right: 95,
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(20),
          dropdownColor: Colors.white,
          value: dropdownValue,
          icon: const Icon(
            Icons.arrow_drop_down,
          ),
          style: subtitleStyle,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            'Residencial',
            'Casa A #100',
            'Casa A #142',
            'Casa B #120'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  Widget _buildTypeCharge() {
    String dropdownValue = 'Cuota';
    return Container(
        padding: const EdgeInsets.only(
          left: 120,
          right: 120,
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(20),
          dropdownColor: Colors.white,
          value: dropdownValue,
          icon: const Icon(
            Icons.arrow_drop_down,
          ),
          style: subtitleStyle,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>[
            'Cuota',
            'Energia',
            'Agua',
            'Evento',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  Widget _buildAmountFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Monto',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildNoteFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Nota',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildCenerateFeeButton() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Generar Cargo',
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
