import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

final modulos = [
  "Usuarios",
  "Visitas",
  "Reservas",
  "Cartera",
  "Quejas",
  "Comunicados"
];

class AdminHomeScreen extends StatelessWidget {
  const AdminHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Administrador",
          style: TextStyle(color: kPrimaryColor),
        ),
        centerTitle: true,
        actions: [
          Container(
              decoration: const BoxDecoration(color: kPrimaryColor),
              child: const Icon(Icons.menu)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(10)),
                height: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        SizedBox(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)),
                            child: const Icon(Icons.payment,
                                color: Colors.white, size: 50),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(5)),
                          padding: const EdgeInsets.all(10),
                          child: const Text("Pagos",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        const Spacer()
                      ],
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: GridView.count(
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              crossAxisCount: 2,
              children: List.generate(
                  modulos.length,
                  (index) => Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        height: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                const Spacer(),
                                SizedBox(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: const Icon(Icons.person,
                                        color: Colors.white, size: 50),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: const EdgeInsets.all(10),
                                  child: Text(modulos[index],
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                const Spacer()
                              ],
                            )
                          ],
                        ),
                      )),
            ))
          ],
        ),
      ),
    );
  }
}
