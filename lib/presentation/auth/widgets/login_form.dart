import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/auth/auth_cubit.dart';
import 'package:residente_app/cubits/auth/form_submission_status.dart';
import 'package:residente_app/helper/keyboard.dart';
import 'package:residente_app/presentation/widgets/custom_suffix_icon.dart';
import 'package:residente_app/presentation/widgets/default_button.dart';
import 'package:residente_app/presentation/widgets/form_error.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String?> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        final formStatus = state.formStatus;

        if (formStatus is SubmissionFailed) {
          _showSnackBar(
              context, "Ha ocurrido un error y no se pudo iniciar sesión.");
        }

        if (formStatus is SubmissionSuccess) {
          if (state.usuario!.tipoUsuarioId == 1) {
            Navigator.pushNamedAndRemoveUntil(
                context, "admin_home", (route) => false);
          }

          if (state.usuario!.tipoUsuarioId == 2) {
            Navigator.pushNamedAndRemoveUntil(
                context, "resident_menu", (route) => false);
          }

          if (state.usuario!.tipoUsuarioId == 3) {
            Navigator.pushNamedAndRemoveUntil(
                context, "guard_menu", (route) => false);
          }
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              buildEmailFormField(),
              const SizedBox(height: 30),
              buildPasswordFormField(),
              const SizedBox(height: 30),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () =>
                        {Navigator.pushNamed(context, "auth_forgot_password")},
                    child: const Text(
                      "Olvide mi contraseña",
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              FormError(errors: errors),
              const SizedBox(height: 20),
              DefaultButton(
                  child: (state.formStatus is FormSubmitting)
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                  onPress: () async {
                    if (!_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      return;
                    }

                    KeyboardUtil.hideKeyboard(context);
                    context.read<AuthCubit>().login();
                  }),
            ],
          ),
        );
      },
    );
  }

  Widget buildPasswordFormField() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return TextFormField(
          cursorColor: Colors.orange.shade900,
          obscureText: true,
          onChanged: (value) {
            if (value.isNotEmpty) {
              removeError(error: kPassNullError);
            } else if (value.length >= 8) {
              removeError(error: kShortPassError);
            }
            context.read<AuthCubit>().onChangePassword(value);
          },
          validator: (value) {
            if (value!.isEmpty) {
              addError(error: kPassNullError);
              return "";
            } else if (value.length < 8) {
              addError(error: kShortPassError);
              return "";
            }
            return null;
          },
          decoration: InputDecoration(
            border: outlineInputBorder(),
            labelText: "Contraseña",
            labelStyle: TextStyle(
              color: Colors.orange.shade900,
            ),
            hintText: "Ingresa tu contraseña",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon:
                const CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          ),
        );
      },
    );
  }

  Widget buildEmailFormField() {
    return TextFormField(
      cursorColor: Colors.orange.shade900,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }

        context.read<AuthCubit>().onChangeEmail(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        border: outlineInputBorder(),
        labelText: "Correo",
        labelStyle: TextStyle(
          color: Colors.orange.shade900,
        ),
        hintText: "Ingresa tu correo",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
