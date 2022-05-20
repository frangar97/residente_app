import 'package:flutter/material.dart';
import 'package:residente_app/presentation/wallet/account_status/widgets/account_chart.dart';
import 'package:residente_app/presentation/wallet/account_status/widgets/account_report.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/scroll_navigation.dart';

class AccountStatusBody extends StatefulWidget {
  const AccountStatusBody({Key? key}) : super(key: key);

  @override
  State<AccountStatusBody> createState() => _AccountStatusBodyState();
}

class _AccountStatusBodyState extends State<AccountStatusBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildAppBar(),
      ),
      body: _buildHorizontalTab(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black87,
      elevation: 0,
      centerTitle: true,
      title: const Text("Estado de Cuenta"),
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

  Widget _buildHorizontalTab() {
    return ScrollNavigation(
      identiferStyle: const NavigationIdentiferStyle(color: Colors.black),
      barStyle: const NavigationBarStyle(
        activeColor: Colors.black,
        position: NavigationPosition.top,
        background: Colors.white,
        elevation: 0.0,
      ),
      pages: const [
        AccountReport(),
        AccountChart(),
      ],
      items: const [
        ScrollNavigationItem(
            title: 'Reporte', icon: Icon(Icons.account_balance)),
        ScrollNavigationItem(
            title: 'Grafica', icon: Icon(Icons.pie_chart_rounded)),
      ],
    );
  }
}
