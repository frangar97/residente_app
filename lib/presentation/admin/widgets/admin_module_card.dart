import 'package:flutter/material.dart';
import 'package:residente_app/core/utils/style_constants.dart';

class AdminModuleCard extends StatelessWidget {
  final String modulo;
  const AdminModuleCard({Key? key, required this.modulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kPrimaryColor, borderRadius: BorderRadius.circular(10)),
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
                  child:
                      const Icon(Icons.person, color: Colors.white, size: 50),
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
                child: Text(modulo,
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              const Spacer()
            ],
          )
        ],
      ),
    );
  }
}
