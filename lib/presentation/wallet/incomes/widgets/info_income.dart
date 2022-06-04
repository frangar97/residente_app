import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class InfoIncome extends StatefulWidget {
  const InfoIncome({Key? key}) : super(key: key);

  @override
  State<InfoIncome> createState() => _InfoIncomeState();
}

class _InfoIncomeState extends State<InfoIncome> {
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
      title: const Text("Ingresos"),
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
        _buildIncomeInfoItem(),
        const SizedBox(height: 30),
        _buildAttachedFile(),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildIncomeInfoItem() {
    return Column(
      verticalDirection: VerticalDirection.down,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Center(
          child: Text(
            'Ingreso',
            style: headingStyle,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        _buildIncomeDate(),
        const SizedBox(
          height: 30,
        ),
        RichText(
          text: const TextSpan(
            text: 'Monto:',
            style: subtitle2Style,
            children: <TextSpan>[
              TextSpan(
                text: '\n\n4500.00L',
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
            text: 'Descripcion:',
            style: subtitle2Style,
            children: <TextSpan>[
              TextSpan(
                text: '\n\nVenta total de boletos de rifa de tablet Lenovo.',
                style: subtitleStyle,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildIncomeDate() {
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
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              fit: BoxFit.fill,
              alignment: Alignment.topRight,
              image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCKnuF-JJjfh0kh04DfgGPCBR3C_qxYG7V1ZAXTdXqukI2nbE2cvhFOwcZR9S_0y3ADmM&usqp=CAU',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
