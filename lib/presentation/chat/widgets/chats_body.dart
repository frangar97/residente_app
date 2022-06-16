import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/chat/widgets/chat_with_body.dart';

class ChatBody extends StatefulWidget {
  const ChatBody({Key? key}) : super(key: key);

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildAppBar(),
      ),
      body: ListView(padding: const EdgeInsets.all(30), children: [
        Column(
          children: [
            _buildUserItem(),
            _buildUserItem(),
          ],
        ),
      ]),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
      elevation: 0,
      centerTitle: true,
      title: const Text("Chat"),
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

  Widget _buildUserItem() {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        padding: const EdgeInsets.only(top: 8, bottom: 8),
        margin: const EdgeInsets.only(
          top: 8,
          bottom: 8,
        ),
        child: ListTile(
          title: const Text(
            'Caseta - Guardia #2498',
            style: subtitleStyle,
          ),
          leading: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade100),
              child: const Icon(
                Icons.account_circle_outlined,
                size: 35,
                color: Colors.blue,
              )),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, 'chat_with');
      },
    );
  }
}
