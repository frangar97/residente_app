import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class PartVisits extends StatefulWidget {
  const PartVisits({Key? key}) : super(key: key);

  @override
  State<PartVisits> createState() => _PartVisitsState();
}

class _PartVisitsState extends State<PartVisits> {
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
      title: const Text("Bitacora de Visitas"),
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
    return ListView(
      padding: const EdgeInsets.only(left: 30, right: 30),
      children: <Widget>[
        Column(
          children: <Widget>[
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 15,
              ),
              child: TextField(
                onChanged: (value) {},
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  labelText: "Buscar",
                  hintText: "Buscar",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: <Widget>[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return _buildUserItem();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUserItem() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(
        bottom: 8,
      ),
      child: const ListTile(
        title: Text(
          'Eduardo Suarez',
          style: subtitleStyle,
        ),
        leading: Icon(
          Icons.compare_arrows_sharp,
          size: 35,
          color: Colors.blue,
        ),
        trailing: Text('8:00am'),
      ),
    );
  }
}
