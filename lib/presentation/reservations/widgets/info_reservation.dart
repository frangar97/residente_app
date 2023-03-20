import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/cubits/reservacion/reservacion_cubit.dart';

class InfoReservation extends StatefulWidget {
  const InfoReservation({Key? key}) : super(key: key);

  @override
  State<InfoReservation> createState() => _InfoReservationState();
}

class _InfoReservationState extends State<InfoReservation> {
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
      title: const Text("Reservacion"),
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
    return ListView(
      padding: const EdgeInsets.only(left: 30, right: 30),
      shrinkWrap: true,
      children: <Widget>[
        const SizedBox(height: 30),
        _buildReservationInfoItem(),
        const SizedBox(
          height: 80,
        ),
        _buildAprovedRejectButtons(),
      ],
    );
  }

  Widget _buildReservationInfoItem() {
    return BlocBuilder<ReservacionCubit, ReservacionState>(
      builder: (context, state) {
        return Column(
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              state.reservacionSeleccionada!.username,
              style: headingStyle,
            ),
            const SizedBox(
              height: 30,
            ),
            _buildReservationDate(),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                text: 'Lugar:',
                style: subtitle2Style,
                children: <TextSpan>[
                  TextSpan(
                    text: '\n\n${state.reservacionSeleccionada!.lugar}',
                    style: subtitleStyle,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
              text: TextSpan(
                text: 'Descripcion:',
                style: subtitle2Style,
                children: <TextSpan>[
                  TextSpan(
                    text: '\n\n${state.reservacionSeleccionada!.descripcion}.',
                    style: subtitleStyle,
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildReservationDate() {
    return BlocBuilder<ReservacionCubit, ReservacionState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: 'Fecha:',
                style: subtitle2Style,
                children: <TextSpan>[
                  TextSpan(
                    text: '\r${state.reservacionSeleccionada!.fecha}',
                    style: subtitle2Style,
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildAprovedRejectButtons() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            'Rechazar',
            style: subtitleStyle,
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              const Size(140, 40),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.grey.shade300,
            ),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Aprobar',
            style: textButtonStyle,
          ),
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(
              const Size(140, 40),
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
      ],
    );
  }
}
