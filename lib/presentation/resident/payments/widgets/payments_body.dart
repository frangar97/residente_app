import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/resident/payments/widgets/payments_status.dart';
import 'package:residente_app/presentation/resident/payments/widgets/pending_payment.dart';
import 'package:scroll_navigation/scroll_navigation.dart';

class PaymentsBody extends StatefulWidget {
  const PaymentsBody({Key? key}) : super(key: key);

  @override
  State<PaymentsBody> createState() => _PaymentsBodyState();
}

class _PaymentsBodyState extends State<PaymentsBody> {
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
      flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
      elevation: 0,
      centerTitle: true,
      title: const Text("Pagos"),
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

  Widget _buildHorizontalTab() {
    return ScrollNavigation(
      identiferStyle: const NavigationIdentiferStyle(color: Colors.blue),
      barStyle: const NavigationBarStyle(
        activeColor: Colors.blue,
        position: NavigationPosition.top,
        background: Colors.white,
        elevation: 0.0,
      ),
      pages: const [
        PendingPayment(),
        PaymentsStatus(),
        PaymentsStatus(),
      ],
      items: const [
        ScrollNavigationItem(
            title: 'Pendientes', icon: Icon(Icons.pending_actions_outlined)),
        ScrollNavigationItem(title: 'Aprobados', icon: Icon(Icons.check)),
        ScrollNavigationItem(
            title: 'Por Aprobar', icon: Icon(Icons.access_time)),
      ],
    );
  }
}
