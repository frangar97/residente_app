import 'package:flutter/material.dart';

import 'package:residente_app/presentation/auth/widgets/login_form.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
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
          ),
        ),
      ),
    );
  }
}
