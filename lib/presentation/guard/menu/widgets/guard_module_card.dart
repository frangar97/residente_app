import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class GuardModuleCard extends StatelessWidget {
  final String nombre;
  final String ruta;
  final IconData icon;
  const GuardModuleCard(
      {Key? key, required this.nombre, required this.ruta, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ruta == 'visits') {
          showModalBottomSheet(
            backgroundColor: Colors.grey.shade200,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
            context: context,
            enableDrag: true,
            isScrollControlled: true,
            builder: (context) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Visitas',
                    style: subtitleStyle,
                  ),
                  const SizedBox(height: 20),
                  _buildVisitsItem(context),
                  const SizedBox(height: 10),
                  _buildPartVisitsItem(context),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              );
            },
          );
        } else {
          Navigator.pushNamed(context, ruta);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 1,
                offset: const Offset(2, 4),
              ),
            ],
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SizedBox(
              height: 75,
              child: Icon(icon, color: Colors.blue, size: 60),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(
                nombre,
                style: subtitleStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }

  Widget _buildVisitsItem(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'visits');
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
        child: const ListTile(
            leading: Icon(Icons.three_p_outlined),
            title: Text(
              'Visitas',
              style: subtitleStyle,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _buildPartVisitsItem(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'part_visits');
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
        child: const ListTile(
            leading: Icon(Icons.list_alt_rounded),
            title: Text(
              'Despedir Visitas',
              style: subtitleStyle,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            )),
      ),
    );
  }
}
