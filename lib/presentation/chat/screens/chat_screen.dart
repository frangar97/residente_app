import 'package:flutter/material.dart';
import 'package:residente_app/presentation/chat/widgets/chats_body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ChatBody(),
    );
  }
}
