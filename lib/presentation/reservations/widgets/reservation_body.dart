import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class ReservationBody extends StatefulWidget {
  const ReservationBody({Key? key}) : super(key: key);

  @override
  State<ReservationBody> createState() => _ReservationBodyState();
}

class _ReservationBodyState extends State<ReservationBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      title: const Text("Reservaciones"),
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
              Navigator.pushNamed(context, "create_reservation");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return ListView(children: [
      Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Reservaciones',
            style: subtitleStyle,
          ),
          const SizedBox(
            height: 15,
          ),
          Column(children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return _buildReservationItem();
              },
            ),
          ]),
        ],
      ),
    ]);
  }

  Widget _buildReservationItem() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'info_reservation');
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
            leading: const Icon(Icons.place_rounded),
            title: RichText(
              text: const TextSpan(
                text: 'Calle A #100',
                style: subtitleStyle,
                children: <TextSpan>[
                  TextSpan(
                    text:
                        '\nHola, necesito reservar el quiosco del parquecito de la calle A el dia martes de la proxima semana, por dos horas, es para un kermes de mi hijo.',
                    style: subtitle2Style,
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
}
