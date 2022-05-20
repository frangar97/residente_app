import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class InfoPaymentBody extends StatefulWidget {
  const InfoPaymentBody({Key? key}) : super(key: key);

  @override
  State<InfoPaymentBody> createState() => _InfoPaymentBodyState();
}

class _InfoPaymentBodyState extends State<InfoPaymentBody> {
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
      backgroundColor: Colors.black87,
      elevation: 0,
      centerTitle: true,
      title: const Text("Calle A #100"),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.yellow.shade600,
        ),
        margin: const EdgeInsets.all(8),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
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
    return ListView(children: [
      Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          RichText(
            text: const TextSpan(
              text: 'Cuota',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: ' Agosto 2022',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
          _buildPaymentInfoItem(),
          const SizedBox(height: 30),
          _buildAttachedFile(),
          const SizedBox(height: 20),
          const Divider(
            color: Colors.black,
            height: 30,
            endIndent: 130,
            indent: 130,
            thickness: 1,
          ),
          const SizedBox(height: 20),
          _buildNoteFormField(),
          const SizedBox(height: 20),
          _buildAprovedRejectButtons()
        ],
      ),
    ]);
  }

  Widget _buildPaymentInfoItem() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 8,
          bottom: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Couta',
              style: subtitleStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                '500.00L',
                style: subtitle3Style,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              color: Colors.black,
              height: 30,
              endIndent: 80,
              indent: 80,
              thickness: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            _buildPaymentDate(),
          ],
        ));
  }

  Widget _buildPaymentDate() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        RichText(
          text: const TextSpan(
            text: '\r\r\r\r\rFecha',
            style: subtitle2Style,
            children: <TextSpan>[
              TextSpan(
                text: ' \n01/05/2022',
                style: subtitleStyle,
              )
            ],
          ),
        ),
        RichText(
          text: const TextSpan(
            text: '\r\r\r\r\rFecha',
            style: subtitle2Style,
            children: <TextSpan>[
              TextSpan(
                text: ' \n24/05/2022',
                style: subtitleStyle,
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

  Widget _buildNoteFormField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(left: 60.0, bottom: 10),
          child: Text(
            'Nota de Revisión:',
            style: subtitle2Style,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 40,
            right: 40,
          ),
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
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 60,
            bottom: 10,
            top: 20,
          ),
          child: RichText(
            text: const TextSpan(
              text: 'Aprobado por:',
              style: subtitle2Style,
              children: <TextSpan>[
                TextSpan(
                  text: ' \n\n\r\r\r\r\r\r\r\r\r\r\r\r\r\r\rAdministrador #2',
                  style: subtitleStyle,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAprovedRejectButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Rechazar',
            style: subtitleStyle,
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.only(
                left: 30,
                right: 30,
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
              Colors.grey.shade300,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Aprobar',
            style: subtitleStyle,
          ),
          style: ButtonStyle(
            padding: MaterialStateProperty.all(
              const EdgeInsets.only(
                left: 30,
                right: 30,
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
              Colors.yellow.shade600,
            ),
          ),
        ),
      ],
    );
  }
}
