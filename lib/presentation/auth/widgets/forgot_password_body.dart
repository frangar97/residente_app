import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/widgets/custom_suffix_icon.dart';
import 'package:residente_app/presentation/widgets/default_button.dart';
import 'package:residente_app/presentation/widgets/form_error.dart';

class ForgotPasswordBody extends StatefulWidget {
  const ForgotPasswordBody({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordBody> createState() => _ForgotPasswordBodyState();
}

class _ForgotPasswordBodyState extends State<ForgotPasswordBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(230.0),
        child: ClipPath(
          clipper: WaveClipperOne(),
          child: Container(
            height: 230,
            decoration: const BoxDecoration(
              gradient: kPrimaryGradientColor,
            ),
            child: AppBar(
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
              children: const <Widget>[
                SizedBox(height: 30),
                Text(
                  "¿Olvido su contraseña?",
                  style: TextStyle(
                    fontSize: 28,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Por favor ingresa tu correo y nosotros te\nenviaremos un link para recuperar tu cuenta",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50,
                ),
                ForgotPassForm(),
              ],
            ),
          ]),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  const ForgotPassForm({Key? key}) : super(key: key);

  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            cursorColor: Colors.orange.shade800,
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if (value.isNotEmpty && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
            },
            validator: (value) {
              if (value!.isEmpty && !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (!emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              border: outlineInputBorder(),
              labelText: "Correo",
              labelStyle: TextStyle(color: Colors.orange.shade900),
              hintText: "Ingresa tu correo",
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon:
                  const CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
            ),
          ),
          const SizedBox(height: 30),
          FormError(errors: errors),
          DefaultButton(
            child: const Text(
              "Continuar",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            onPress: () {
              if (_formKey.currentState!.validate()) {
                // Do what you want to do
              }
            },
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        ],
      ),
    );
  }
}
