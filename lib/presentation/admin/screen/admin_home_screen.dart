import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/admin/widgets/admin_module_card.dart';
import 'package:residente_app/presentation/admin/widgets/drawer_dashboard.dart';

class ModuleData {
  final String nombre;
  final String ruta;
  final IconData icon;

  const ModuleData(this.icon, {required this.nombre, required this.ruta});
}

final nombre = [
  'Pagos',
  'Usuarios',
  'Visitas',
  'Reservas',
  'Cartera',
  'Quejas',
  'Comunicados',
  'Encuestas'
];

final ruta = [
  'payments_resident_payment',
  'users',
  'visits',
  'reservations',
  'wallet',
  'incidents',
  'releases',
  'quiz',
];

List<IconData> icon = [
  Icons.attach_money_rounded,
  Icons.person,
  Icons.input_rounded,
  Icons.place_rounded,
  Icons.wallet_rounded,
  Icons.warning_amber_rounded,
  Icons.report_rounded,
  Icons.quiz_rounded,
];

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerDashboard(),
      drawerScrimColor: Colors.black87,
      backgroundColor: Colors.grey.shade100,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(190.0),
        child: _buildAppBar(context),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildAppBar(context) {
    return Center(
      child: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black87,
          size: 30,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Administrador",
          style: subtitleStyle,
        ),
        centerTitle: true,
        flexibleSpace: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.width * 0.4,
            margin: const EdgeInsets.only(top: 100, bottom: 30),
            decoration: const BoxDecoration(
              // borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                fit: BoxFit.fill,
                alignment: Alignment.bottomCenter,
                image: NetworkImage(
                    'https://www.grupowhn.com/images/residencial%20toledo%20logo.png?crc=444117020'),
              ),
            ),
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
