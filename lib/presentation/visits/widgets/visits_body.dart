import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';
import 'package:residente_app/presentation/visits/widgets/eventual_visit.dart';
import 'package:residente_app/presentation/visits/widgets/frequent_visit.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/scroll_navigation.dart';

class VisitsBody extends StatefulWidget {
  const VisitsBody({Key? key}) : super(key: key);

  @override
  State<VisitsBody> createState() => _VisitsBodyState();
}

class _VisitsBodyState extends State<VisitsBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey.shade200,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: _buildAppBar(),
      ),
      body: _buildHorizontalTab(),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      flexibleSpace: Container(
          decoration: const BoxDecoration(gradient: kPrimaryGradientColor)),
      elevation: 0,
      centerTitle: true,
      title: const Text("Visitas"),
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
              showModalBottomSheet(
                backgroundColor: Colors.grey.shade200,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
                context: context,
                enableDrag: true,
                isScrollControlled: true,
                builder: (context) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Tipo de Visita',
                        style: subtitleStyle,
                      ),
                      const SizedBox(height: 20),
                      _buildFrequentVisitItem(),
                      const SizedBox(height: 10),
                      _buildEventualVisitItem(),
                      const SizedBox(height: 30),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildHorizontalTab() {
    return ScrollNavigation(
      identiferStyle: const NavigationIdentiferStyle(color: Colors.blue),
      barStyle: const NavigationBarStyle(
        activeColor: Colors.blue,
        position: NavigationPosition.top,
        background: Colors.white,
        elevation: 0.0,
      ),
      pages: const [
        FrequentVisit(),
        EventualVisit(),
      ],
      items: const [
        ScrollNavigationItem(
            title: 'Frecuente', icon: Icon(Icons.fact_check_outlined)),
        ScrollNavigationItem(
            title: 'Eventual', icon: Icon(Icons.access_time_outlined)),
      ],
    );
  }

  Widget _buildEventualVisitItem() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'create_eventual_visit');
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
        child: const ListTile(
            leading: Icon(Icons.three_p_outlined),
            title: Text(
              'Visita Eventual',
              style: subtitleStyle,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _buildFrequentVisitItem() {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, 'create_frequent_visit');
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
        child: const ListTile(
            leading: Icon(Icons.three_p_outlined),
            title: Text(
              'Visita Frecuente',
              style: subtitleStyle,
            ),
            trailing: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black,
            )),
      ),
    );
  }
}
