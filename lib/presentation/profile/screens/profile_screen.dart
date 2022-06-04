import 'package:flutter/material.dart';
import 'package:residente_app/presentation/profile/widgets/profile_body.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ProfileBody(),
    );
  }
}
