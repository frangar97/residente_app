import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/admin/widgets/admin_module_card.dart';
import 'package:residente_app/presentation/resident/menu/widgets/drawer_dashboard.dart';

class ModuleData {
  final String nombre;
  final String ruta;
  final IconData icon;

  const ModuleData(this.icon, {required this.nombre, required this.ruta});
}

final nombre = [
  'Pagos',
  'Chat Caseta',
  'Visitas',
  'Reservas',
  'Mis Autos',
  'Alerta',
  'Gastos',
  'Quejas',
  'Comunicados',
  'Encuestas'
];

final ruta = [
  'resident_payment_dashboard',
  'chat',
  'visits',
  'reservations',
  'vehicles',
  'panic_alert',
  'expenses',
  'incidents',
  'releases',
  'quiz',
];

List<IconData> icon = [
  Icons.payment_rounded,
  Icons.chat_bubble_outline,
  Icons.how_to_reg_outlined,
  Icons.calendar_month_outlined,
  Icons.directions_car_filled_outlined,
  Icons.report_gmailerrorred_rounded,
  Icons.outbox_outlined,
  Icons.warning_amber_rounded,
  Icons.campaign_outlined,
  Icons.quiz_outlined,
];

class ResidentMenuScreen extends StatelessWidget {
  const ResidentMenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerDashboard(),
      drawerScrimColor: Colors.black54,
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(230.0),
        child: _buildAppBar(context),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(context) {
    return ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        height: 230,
        decoration: const BoxDecoration(
          gradient: kPrimaryGradientColor,
        ),
        child: Center(
          child: AppBar(
            iconTheme: const IconThemeData(
              color: Colors.white,
              size: 30,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            flexibleSpace: Center(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width * 0.35,
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    alignment: Alignment.bottomCenter,
                    image: NetworkImage(
                        'https://www.grupowhn.com/images/residencial%20toledo%20logo.png?crc=444117020'),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  right: 10,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.person_outline_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      child: Column(
        children: [
          Flexible(
            child: GridView.count(
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              crossAxisCount: 2,
              children: List.generate(
                  nombre.length,
                  (index) => AdminModuleCard(
                        nombre: nombre[index],
                        ruta: ruta[index],
                        icon: icon[index],
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
