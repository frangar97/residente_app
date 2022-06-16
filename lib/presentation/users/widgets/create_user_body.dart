import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/users/widgets/create_user_forms.dart';

class CreateUserBody extends StatefulWidget {
  const CreateUserBody({Key? key}) : super(key: key);

  @override
  State<CreateUserBody> createState() => _CreateUserBodyState();
}

class _CreateUserBodyState extends State<CreateUserBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // here the desired height
        child: _buildAppBar(),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              const CreateUserForms(),
              _buildCreateButton(),
            ],
          ),
        ],
      ),
      // body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
      elevation: 0,
      centerTitle: true,
      title: const Text("Crear Usuario"),
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

  Widget _buildCreateButton() {
    return TextButton(
      onPressed: () {},
      child: const Text(
        'Crear Usuario',
        style: textButtonStyle,
      ),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width, 40),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.orange.shade600,
        ),
      ),
    );
  }
}
