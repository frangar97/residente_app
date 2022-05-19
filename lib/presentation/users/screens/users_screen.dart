import 'package:flutter/material.dart';
import 'package:residente_app/presentation/users/widgets/users_body.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: UsersBody(),
    ));
  }
}
