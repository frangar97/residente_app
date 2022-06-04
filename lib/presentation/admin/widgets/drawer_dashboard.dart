import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class DrawerDashboard extends StatelessWidget {
  const DrawerDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(gradient: kPrimaryGradientColor),
            child: Center(
              child: Row(
                children: const <Widget>[
                  Expanded(
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 40,
                    ),
                    flex: 2,
                  ),
                  Expanded(
                    flex: 6,
                    child: Text(
                      "Administrador #1",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              "Salir",
              style: subtitleStyle,
            ),
            leading: IconButton(
              icon: const Icon(Icons.exit_to_app_rounded),
              onPressed: () {
                // Navigator.pushNamed(context, routeName);
              },
            ),
            onTap: () {
              Navigator.pushNamed(context, 'auth_login');
            },
          ),
        ],
      ),
    );
  }
}
