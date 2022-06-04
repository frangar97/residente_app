import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/widgets/date_time_picker.dart';

class CreateIncome extends StatefulWidget {
  const CreateIncome({Key? key}) : super(key: key);

  @override
  State<CreateIncome> createState() => _CreateIncomeState();
}

class _CreateIncomeState extends State<CreateIncome> {
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
      title: const Text("Generar Ingreso"),
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
                  'Ingreso',
                  style: subtitleStyle,
                ),
                const SizedBox(
                  height: 30,
                ),
                const DateTimePicker(),
                const SizedBox(
                  height: 30,
                ),
                _buildTitleFormField(),
                const SizedBox(
                  height: 30,
                ),
                _buildAmountFormField(),
                const SizedBox(
                  height: 30,
                ),
                _buildDescriptionFormField(),
                const SizedBox(
                  height: 30,
                ),
                _buildAttachedFile(),
                const SizedBox(
                  height: 90,
                ),
                _buildCenerateIncomeButton(),
              ],
            ),
          ),
        ]);
  }

  Widget _buildTitleFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Titulo',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildAmountFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Monto',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildDescriptionFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Descripcion',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildAttachedFile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text(
          'Archivo adjunto:',
          style: subtitle2Style,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.09,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.attach_file),
        ),
      ],
    );
  }

  Widget _buildCenerateIncomeButton() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Generar Ingreso',
        style: textButtonStyle,
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(
            left: 20,
            right: 20,
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
