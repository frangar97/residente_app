import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:residente_app/core/utils/style_constants.dart';

import 'package:residente_app/presentation/auth/widgets/login_form.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(230.0),
        child: ClipPath(
          clipper: WaveClipperTwo(flip: true),
          child: Container(
            height: 230,
            decoration: const BoxDecoration(
              gradient: kPrimaryGradientColor,
            ),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 30, right: 30),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.035),
              const Text(
                "Bienvenido",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              const LoginForm(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
