import 'package:flutter/material.dart';
import 'package:residente_app/presentation/users/widgets/create_user_body.dart';

class CreateUserScreen extends StatelessWidget {
  const CreateUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CreateUserBody(),
    );
  }
}
