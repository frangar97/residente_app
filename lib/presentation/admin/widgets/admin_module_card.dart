import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class AdminModuleCard extends StatelessWidget {
  final String nombre;
  final String ruta;
  final IconData icon;
  const AdminModuleCard(
      {Key? key, required this.nombre, required this.ruta, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (ruta == 'payments_resident_payment') {
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
                    'Pagos',
                    style: subtitleStyle,
                  ),
                  const SizedBox(height: 20),
                  _buildResidentPaymentsItem(context),
                  const SizedBox(height: 10),
                  _buildGenerateChargeItem(context),
                  const SizedBox(height: 30),
                ],
              );
            },
          );
        } else if (ruta == 'wallet') {
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
                    'Pagos',
                    style: subtitleStyle,
                  ),
                  const SizedBox(height: 20),
                  _buildIncomesItem(context),
                  const SizedBox(height: 10),
                  _buildExpensesItem(context),
                  const SizedBox(height: 10),
                  _buildAccountStatusItem(context),
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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Spacer(),
                SizedBox(
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(icon, color: Colors.white, size: 35),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.all(10),
                  child: Text(nombre, style: subtitleStyle),
                ),
                const Spacer()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildResidentPaymentsItem(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'payments_resident_payment');
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
            leading: Icon(Icons.three_p_rounded),
            title: Text(
              'Pagos de Residentes',
              style: subtitleStyle,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _buildGenerateChargeItem(context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'payments_charges');
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
            leading: Icon(Icons.three_p_rounded),
            title: Text(
              'Generar Cuotas',
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

Widget _buildExpensesItem(context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'expenses');
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
          leading: Icon(Icons.outbox_rounded),
          title: Text(
            'Gastos',
            style: subtitleStyle,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          )),
    ),
  );
}

Widget _buildIncomesItem(context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'incomes');
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
          leading: Icon(Icons.move_to_inbox_rounded),
          title: Text(
            'Ingresos',
            style: subtitleStyle,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          )),
    ),
  );
}

Widget _buildAccountStatusItem(context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, 'account_status');
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
          leading: Icon(Icons.account_balance_rounded),
          title: Text(
            'Estado de Cuenta',
            style: subtitleStyle,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.black,
          )),
    ),
  );
}
