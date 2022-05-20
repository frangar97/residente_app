import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/visits/widgets/active_days_frequent_visit.dart';

class CreateFrequentVisit extends StatefulWidget {
  const CreateFrequentVisit({Key? key}) : super(key: key);

  @override
  State<CreateFrequentVisit> createState() => _CreateFrequentVisitState();
}

class _CreateFrequentVisitState extends State<CreateFrequentVisit> {
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
      backgroundColor: Colors.black87,
      elevation: 0,
      centerTitle: true,
      title: const Text("Generar Visita"),
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.yellow.shade600,
        ),
        margin: const EdgeInsets.all(8),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
            color: Colors.black,
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
                  'Visita Frecuente',
                  style: subtitleStyle,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              _buildVisitType(),
              const SizedBox(
                height: 30,
              ),
              _buildNameFormField(),
              const SizedBox(
                height: 30,
              ),
              _buildNoteFormField(),
              const SizedBox(
                height: 30,
              ),
              _buildAttachedFile(),
              const SizedBox(
                height: 20,
              ),
              const ActiveDaysFrequentVisit(),
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
    );
  }

  Widget _buildVisitType() {
    String dropdownValue = 'Familiar';
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
        child: DropdownButton<String>(
          borderRadius: BorderRadius.circular(20),
          dropdownColor: Colors.white,
          value: dropdownValue,
          icon: const Icon(
            Icons.arrow_drop_down,
          ),
          style: subtitleStyle,
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
            });
          },
          items: <String>['Familiar', 'Servicio a Domicilio', 'Tecnico', 'Aseo']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
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
          hintText: 'Nombre',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildNoteFormField() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintStyle: subtitle2Style,
          hintText: 'Nota',
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }

  Widget _buildAttachedFile() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Text(
          'Adjuntar foto:',
          style: subtitle2Style,
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.09,
          width: MediaQuery.of(context).size.width * 0.2,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Icon(Icons.attach_file),
        ),
      ],
    );
  }

  Widget _buildCenerateVisitButton() {
    return Center(
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Generar Visita',
          style: subtitleStyle,
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
            Colors.yellow.shade600,
          ),
        ),
      ),
    );
  }
}
