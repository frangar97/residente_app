import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/widgets/custom_suffix_icon.dart';

class CreateUserForms extends StatefulWidget {
  const CreateUserForms({Key? key}) : super(key: key);

  @override
  State<CreateUserForms> createState() => _CreateUserFormsState();
}

class _CreateUserFormsState extends State<CreateUserForms> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Usuario',
            style: subtitleStyle,
          ),
          const SizedBox(
            height: 30,
          ),
          _buildNameFormField(),
          const SizedBox(
            height: 30,
          ),
          _buildPasswordFormField(),
          const SizedBox(
            height: 30,
          ),
          _buildConfirmPasswordFormField(),
          const SizedBox(
            height: 30,
          ),
          _buildAddressFormField(),
          const SizedBox(
            height: 30,
          ),
          _buildPhoneFormField(),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget _buildNameFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Nombre de Usuario',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
        ),
      ),
    );
  }

  Widget _buildPasswordFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        ),
      ),
    );
  }

  Widget _buildConfirmPasswordFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Confirmar Contraseña',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
        ),
      ),
    );
  }

  Widget _buildAddressFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Direccion',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          suffixIcon:
              CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
        ),
      ),
    );
  }

  Widget _buildPhoneFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Telefono',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
          suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
        ),
      ),
    );
  }
}
