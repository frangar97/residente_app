import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:bubble/bubble.dart';

class ChatWithBody extends StatefulWidget {
  const ChatWithBody({Key? key}) : super(key: key);

  @override
  State<ChatWithBody> createState() => _ChatWithBodyState();
}

class _ChatWithBodyState extends State<ChatWithBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomSheet: _buildChatBar(),
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.grey.shade200,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: _buildAppBar(),
        ),
        body: ListView(
            padding: const EdgeInsets.all(20), children: [_buildMessages()]));
  }

  Widget _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
      elevation: 0,
      centerTitle: true,
      title: const Text("Caseta - Guardia #2498"),
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

  Widget _buildChatBar() {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 15),
      height: MediaQuery.of(context).size.height * 0.09,
      decoration: const BoxDecoration(gradient: kPrimaryGradientColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: _buildMessageFormField()),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Icon(
              Icons.send_outlined,
              color: kPrimaryLightColor,
              size: 30,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMessages() {
    return Column(children: [
      Bubble(
        alignment: Alignment.center,
        color: const Color.fromARGB(255, 212, 234, 244),
        margin: const BubbleEdges.only(top: 8),
        child: const Text(
          'TODAY',
          style: TextStyle(fontSize: 10),
        ),
      ),
      Bubble(
        style: styleMe,
        child: const Text("Hola"),
      ),
      Bubble(
        style: styleSomebody,
        child: const Text("Hola, buenas! Digame?"),
      ),
      Bubble(
        style: styleMe,
        margin: const BubbleEdges.only(top: 9),
        showNip: false,
        child: const Text(
            'Viene una visita, pero no tiene internet para enviarle el codigo QR, puedo ir a recibirlo?'),
      ),
      Bubble(
        style: styleSomebody,
        child: const Text('Si, esta bien!'),
      ),
      Bubble(
        style: styleMe,
        showNip: false,
        margin: const BubbleEdges.only(top: 9),
        child: const Text("Ok, muchas gracias."),
      ),
    ]);
  }

  Widget _buildMessageFormField() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.06,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(20),
          ),
        ));
  }
}
