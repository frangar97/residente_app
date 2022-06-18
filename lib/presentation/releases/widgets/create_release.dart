import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/auth/form_submission_status.dart';
import 'package:residente_app/cubits/comunicado/comunicado_cubit.dart';
import 'package:residente_app/helper/keyboard.dart';
import 'package:residente_app/helper/snack_bar.dart';

class CreateRelease extends StatefulWidget {
  const CreateRelease({Key? key}) : super(key: key);

  @override
  State<CreateRelease> createState() => _CreateReleaseState();
}

class _CreateReleaseState extends State<CreateRelease> {
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
      title: const Text("Generar Comunicado"),
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
    return BlocConsumer<ComunicadoCubit, ComunicadoState>(
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
                        'Comunicado',
                        style: subtitleStyle,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          ElevatedButton(
                            style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  theme: const DatePickerTheme(
                                    backgroundColor: Colors.white,
                                    containerHeight: 210.0,
                                  ),
                                  showTitleActions: true,
                                  minTime: DateTime(2000, 1, 1),
                                  maxTime: DateTime(2022, 12, 31),
                                  onConfirm: (date) {
                                context.read<ComunicadoCubit>().onChangeFecha(
                                    '${date.year}-${date.month}-${date.day}');
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.es);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 65.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            state.fecha == ""
                                                ? "Fecha"
                                                : state.fecha,
                                            style: subtitle2Style,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const Icon(
                                    Icons.date_range,
                                    size: 25.0,
                                    color: kSecondaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildTitleFormField(context),
                      const SizedBox(
                        height: 30,
                      ),
                      _buildDescriptionFormField(context),
                      const SizedBox(
                        height: 90,
                      ),
                      _buildCenerateReleaseButton(context),
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
          context.read<ComunicadoCubit>().onChangeTitulo(value);
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

  Widget _buildDescriptionFormField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: (value) {
          context.read<ComunicadoCubit>().onChangeDescripcion(value);
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

  Widget _buildCenerateReleaseButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (!_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          showSnackBar(context, "Por favor llene todos los campos.");
          return;
        }
        KeyboardUtil.hideKeyboard(context);
        context.read<ComunicadoCubit>().crearInicidente();
      },
      child: const Text(
        'Generar Comunicado',
        style: textButtonStyle,
      ),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.of(context).size.width, 40),
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
