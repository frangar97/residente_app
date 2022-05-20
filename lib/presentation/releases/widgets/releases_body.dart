import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class ReleasesBody extends StatefulWidget {
  const ReleasesBody({Key? key}) : super(key: key);

  @override
  State<ReleasesBody> createState() => _ReleasesBodyState();
}

class _ReleasesBodyState extends State<ReleasesBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      title: const Text("Comunicados"),
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
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            right: 10,
          ),
          child: IconButton(
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pushNamed(context, "create_release");
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        const Text(
          'Comunicados',
          style: subtitleStyle,
        ),
        const SizedBox(
          height: 15,
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1,
            itemBuilder: (context, index) {
              return _buildReleaseItem();
            },
          ),
        ),
      ],
    );
  }

  Widget _buildReleaseItem() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'info_release');
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: 20,
        ),
        margin: const EdgeInsets.only(
          left: 30,
          right: 30,
          top: 8,
          bottom: 10,
        ),
        child: ListTile(
            leading: const Icon(Icons.report),
            title: RichText(
              text: const TextSpan(
                text: 'Comunicado',
                style: subtitleStyle,
                children: <TextSpan>[
                  TextSpan(
                    text:
                        '\nHola residente, te comunicamos que el dia de mañana tendremos mantenimiento de alambradro electrico.',
                    style: subtitle2Style,
                  )
                ],
              ),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            )),
      ),
    );
  }
}
