import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class UsersBody extends StatefulWidget {
  const UsersBody({Key? key}) : super(key: key);

  @override
  State<UsersBody> createState() => _UsersBodyState();
}

class _UsersBodyState extends State<UsersBody> {
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
      backgroundColor: Colors.black87,
      elevation: 0,
      centerTitle: true,
      title: const Text("Usuarios"),
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
          onPressed: () {},
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
              Navigator.pushNamed(context, "create_user");
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
          height: 15,
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 15,
            bottom: 15,
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
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return _buildUserItem();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUserItem() {
    bool isSwitched = false;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 8,
        bottom: 8,
      ),
      child: ListTile(
        title: const Text(
          'Calle A #100',
          style: subtitleStyle,
        ),
        leading: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.grey),
            child: const Icon(
              Icons.house_rounded,
              size: 35,
              color: Colors.white,
            )),
        trailing: Switch(
          value: isSwitched,
          onChanged: (value) {
            setState(() {
              isSwitched = value;
            });
          },
        ),
      ),
    );
  }
}
