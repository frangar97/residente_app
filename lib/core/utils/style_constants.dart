import 'package:flutter/material.dart';

const kPrimaryColor = Colors.black87;
const kPrimaryLightColor = Color(0xFFFFECDF);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
  height: 1.5,
);

const subtitleStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
  height: 1.0,
);

const subtitle2Style = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: kSecondaryColor,
);

const subtitle3Style = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
);

const accountDivider = Divider(
  color: Colors.black,
  height: 30,
  endIndent: 20,
  indent: 20,
  thickness: 1,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Por favor ingresa tu correo";
const String kInvalidEmailError = "Por favor ingresa correo valido";
const String kPassNullError = "Por favor ingresa tu contraseña";
const String kShortPassError = "Contraseña es muy corta";
const String kMatchPassError = "Contraseña no coincide";
const String kNamelNullError = "Por favor ingresa tu nombre";
const String kPhoneNumberNullError = "Por favor ingresa tu numero de telefono";
const String kAddressNullError = "Por favor ingresa tu dirección";

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 15),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(color: kTextColor),
  );
}
