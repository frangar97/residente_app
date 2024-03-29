import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildAppBar(),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(30),
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: _buildBody(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
      elevation: 0,
      centerTitle: true,
      title: const Text("Perfil"),
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
      shrinkWrap: true,
      children: <Widget>[
        const SizedBox(height: 30),
        _buildProfilePhoto(),
        const SizedBox(height: 30),
        _buildProfileInfo(),
        const SizedBox(height: 40),
        const Divider(
          color: Colors.black,
          height: 30,
          endIndent: 130,
          indent: 130,
          thickness: 1,
        ),
        const SizedBox(height: 40),
        _buildChangePassword(),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // verticalDirection: VerticalDirection.down,
      children: <Widget>[
        const Center(
          child: Text(
            'Casa A #100',
            style: headingStyle,
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          text: const TextSpan(
            text: 'Estado:',
            style: subtitle2Style,
            children: <TextSpan>[
              TextSpan(
                text: '\rActivo',
                style: activeStyle,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          text: const TextSpan(
            text: 'Tipo:',
            style: subtitle2Style,
            children: <TextSpan>[
              TextSpan(
                text: '\r Residente',
                style: subtitleStyle,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          overflow: TextOverflow.visible,
          text: const TextSpan(
            text: 'Direccion:',
            style: subtitle2Style,
            children: <TextSpan>[
              TextSpan(
                text: '\rCasa A #100, bloque C-1',
                style: subtitleStyle,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        RichText(
          text: const TextSpan(
            text: 'Telefono:',
            style: subtitle2Style,
            children: <TextSpan>[
              TextSpan(
                text: '\r97659023',
                style: subtitleStyle,
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfilePhoto() {
    return CircleAvatar(
      maxRadius: 75,
      backgroundColor: Colors.grey,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(80),
        child: Image.network(
          'https://thumbs.dreamstime.com/b/perfil-de-usuario-vectorial-avatar-predeterminado-179376714.jpg',
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return const Text('Sin foto');
          },
        ),
      ),
    );
  }

  Widget _buildChangePassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Modificar contraseña',
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
        ),
      ],
    );
  }
}
