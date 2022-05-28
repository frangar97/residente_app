import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class ExpensesBody extends StatefulWidget {
  const ExpensesBody({Key? key}) : super(key: key);

  @override
  State<ExpensesBody> createState() => _ExpensesBodyState();
}

class _ExpensesBodyState extends State<ExpensesBody> {
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
      title: const Text("Gastos"),
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
              Navigator.pushNamed(context, "create_expense");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Gastos',
          style: subtitleStyle,
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return _buildExpenseItem();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildExpenseItem() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'info_expense');
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
            leading: const Icon(Icons.outbox_rounded),
            title: RichText(
              text: const TextSpan(
                text: 'Compra de tubo 3"',
                style: subtitleStyle,
                children: <TextSpan>[
                  TextSpan(
                    text:
                        '\nCompra de 2 tubos de metal de 3 pulgas, para reparar la fuga de agua de la calle A',
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
