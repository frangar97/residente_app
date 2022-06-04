import 'package:flutter/material.dart';
import 'package:residente_app/presentation/releases/widgets/releases_body.dart';

class ReleasesScreen extends StatelessWidget {
  const ReleasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ReleasesBody(),
    );
  }
}
