import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/auth/form_submission_status.dart';
import 'package:residente_app/cubits/visita/visita_cubit.dart';
import 'package:residente_app/features/visita/tipo_visita_model.dart';
import 'package:residente_app/helper/keyboard.dart';
import 'package:residente_app/helper/snack_bar.dart';

class CreateEventualVisit extends StatefulWidget {
  const CreateEventualVisit({Key? key}) : super(key: key);

  @override
  State<CreateEventualVisit> createState() => _CreateEventualVisitState();
}

class _CreateEventualVisitState extends State<CreateEventualVisit> {
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
      title: const Text("Generar Visita"),
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
    bool isSwitched = false;
    return BlocConsumer<VisitaCubit, VisitaState>(
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
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 30,
                    ),
                    const Center(
                      child: Text(
                        'Visita Eventual',
                        style: subtitleStyle,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    _buildVisitType(context, state),
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
                              context.read<VisitaCubit>().onChangeFecha(
                                  '${date.year}-${date.month}-${date.day}');
                            },
                                currentTime: DateTime.now(),
                                locale: LocaleType.en);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: 65.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    const SizedBox(height: 30),
                    _buildNameFormField(context),
                    const SizedBox(
                      height: 30,
                    ),
                    _buildNoteFormField(context),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          'Es Evento/Fiesta',
                          style: subtitle2Style,
                        ),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    //_buildQrCode(),
                    const SizedBox(
                      height: 40,
                    ),
                    _buildCenerateVisitButton(),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildVisitType(BuildContext context, VisitaState state) {
    return Container(
        padding: const EdgeInsets.only(
          left: 60,
          right: 60,
          top: 8,
          bottom: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: DropdownButton<TipoVisitaModel>(
          borderRadius: BorderRadius.circular(20),
          dropdownColor: Colors.white,
          value: state.tipoVisitaSeleccionado,
          icon: const Icon(
            Icons.arrow_drop_down,
          ),
          style: subtitleStyle,
          onChanged: (TipoVisitaModel? newValue) {
            context.read<VisitaCubit>().seleccionarTipoVisita(newValue);
          },
          items: state.tipoVisita
              .map<DropdownMenuItem<TipoVisitaModel>>((TipoVisitaModel value) {
            return DropdownMenuItem<TipoVisitaModel>(
              value: value,
              child: Text(value.nombre),
            );
          }).toList(),
        ));
  }

  Widget _buildNameFormField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: (value) {
          context.read<VisitaCubit>().onChangeNombre(value);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Nombre',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildNoteFormField(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        onChanged: (value) {
          context.read<VisitaCubit>().onChangeNota(value);
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "";
          }
          return null;
        },
        decoration: const InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Nota',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildQrCode() {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            backgroundColor: Colors.grey.shade200,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            title: const Center(child: Text("Compartir:")),
            content: _buildWhatsAppShare(),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                child: const Text(
                  "Ok",
                  style: subtitleStyle,
                ),
              ),
            ],
            actionsPadding: EdgeInsets.zero,
          ),
        );
      },
      child: Center(
        child: Container(
          alignment: Alignment.topCenter,
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.45,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              alignment: Alignment.topRight,
              image: NetworkImage(
                'https://qrcode.tec-it.com/API/QRCode?data=smsto%3A555-555-5555%3AGenerador+de+C%C3%B3digos+QR+de+TEC-IT',
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWhatsAppShare() {
    return Container(
      margin: const EdgeInsets.only(left: 80, right: 80),
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomCenter,
      height: 75,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          fit: BoxFit.scaleDown,
          image: NetworkImage(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/WhatsApp_logo-color-vertical.svg/2048px-WhatsApp_logo-color-vertical.svg.png',
          ),
        ),
      ),
    );
  }

  Widget _buildCenerateVisitButton() {
    return Center(
      child: TextButton(
        onPressed: () {
          if (!_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            showSnackBar(context, "Por favor llene todos los campos.");
            return;
          }
          KeyboardUtil.hideKeyboard(context);
          context.read<VisitaCubit>().crearVisitaEventual();
        },
        child: const Text(
          'Generar Visita',
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
      ),
    );
  }
}
