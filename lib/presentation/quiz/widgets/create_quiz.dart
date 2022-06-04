import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/auth/form_submission_status.dart';
import 'package:residente_app/cubits/encuesta/encuesta_cubit.dart';
import 'package:residente_app/helper/keyboard.dart';
import 'package:residente_app/helper/snack_bar.dart';
import 'package:residente_app/presentation/widgets/date_time_picker.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({Key? key}) : super(key: key);

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildAppBar(),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
      elevation: 0,
      centerTitle: true,
      title: const Text("Generar Encuesta"),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.orange.shade800,
        ),
        margin: const EdgeInsets.all(8),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.white,
            size: 25,
          ),
          tooltip: 'Atras',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<EncuestaCubit, EncuestaState>(
      listener: (context, state) {
        final formStatus = state.formStatus;

        if (formStatus is SubmissionFailed) {
          showSnackBar(
              context, "Ha ocurrido un error y no se pudo crear el incidente.");
        }

        if (formStatus is SubmissionSuccess) {
          Navigator.of(context).pop();
        }
      },
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: ListView(
              padding: const EdgeInsets.only(left: 30, right: 30),
              children: [
                Center(
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Encuesta',
                        style: subtitleStyle,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const DateTimePicker(),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildTitleFormField(context),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildLinkFormField(context),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildDescriptionFormField(context),
                      const SizedBox(
                        height: 90,
                      ),
                      _buildCenerateQuizButton(context),
                    ],
                  ),
                ),
              ]),
        );
      },
    );
  }

  Widget _buildTitleFormField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: (value) {
          context.read<EncuestaCubit>().onChangeTitulo(value);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Titulo',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildLinkFormField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: (value) {
          context.read<EncuestaCubit>().onChangeLink(value);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Link',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildDescriptionFormField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: (value) {
          context.read<EncuestaCubit>().onChangeDescripcion(value);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Descripcion',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildCenerateQuizButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (!_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          showSnackBar(context, "Por favor llene todos los campos.");
          return;
        }
        KeyboardUtil.hideKeyboard(context);
        context.read<EncuestaCubit>().crearEncuesta();
      },
      child: const Text(
        'Generar Quiz',
        style: textButtonStyle,
      ),
      style: ButtonStyle(
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 10,
            bottom: 10,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Colors.orange.shade600,
        ),
      ),
    );
  }
}
