import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/widgets/date_time_picker.dart';

class CreateEventualVisit extends StatefulWidget {
  const CreateEventualVisit({Key? key}) : super(key: key);

  @override
  State<CreateEventualVisit> createState() => _CreateEventualVisitState();
}

class _CreateEventualVisitState extends State<CreateEventualVisit> {
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
      title: const Text("Generar Visita"),
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
    bool isSwitched = false;
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              const Center(
                child: Text(
                  'Visita Eventual',
                  style: subtitleStyle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _buildVisitType(),
              const SizedBox(
                height: 30,
              ),
              const DateTimePicker(),
              const SizedBox(height: 30),
              _buildNameFormField(),
              const SizedBox(
                height: 30,
              ),
              _buildNoteFormField(),
              const SizedBox(
                height: 40,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Es Evento/Fiesta',
                    style: subtitle2Style,
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              _buildQrCode(),
              const SizedBox(
                height: 40,
              ),
              _buildCenerateVisitButton(),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildVisitType() {
    String dropdownValue = 'Familiar';
    return Container(
        padding: const EdgeInsets.only(
          left: 60,
          right: 60,
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
          items: <String>['Familiar', 'Servicio a Domicilio', 'Tecnico', 'Aseo']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  Widget _buildNameFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Nombre',
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

  Widget _buildQrCode() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: Colors.grey.shade200,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Center(child: Text("Compartir:")),
            content: _buildWhatsAppShare(),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  "Ok",
                  style: subtitleStyle,
                ),
              ),
            ],
            actionsPadding: EdgeInsets.zero,
          ),
        );
      },
      child: Center(
        child: Container(
          alignment: Alignment.topCenter,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              alignment: Alignment.topRight,
              image: NetworkImage(
                'https://qrcode.tec-it.com/API/QRCode?data=smsto%3A555-555-5555%3AGenerador+de+C%C3%B3digos+QR+de+TEC-IT',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWhatsAppShare() {
    return Container(
      margin: const EdgeInsets.only(left: 80, right: 80),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomCenter,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          fit: BoxFit.scaleDown,
          image: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/WhatsApp_logo-color-vertical.svg/2048px-WhatsApp_logo-color-vertical.svg.png',
          ),
        ),
      ),
    );
  }

  Widget _buildCenerateVisitButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Generar Visita',
          style: textButtonStyle,
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
            Colors.orange.shade600,
          ),
        ),
      ),
    );
  }
}
