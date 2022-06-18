import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScan extends StatelessWidget {
  QRScan({Key? key}) : super(key: key);

  MobileScannerController cameraController = MobileScannerController();
  bool _screenOpened = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scanear QR')),
      body: MobileScanner(
          allowDuplicates: false,
          onDetect: (barcode, args) {
            if (barcode.rawValue == null) {
              debugPrint('Failed to scan Barcode');
            } else {
              final String code = barcode.rawValue!;
              debugPrint('Barcode found! $code');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoundCodeScreen(
                        screenClosed: _screenWasClosed, value: code),
                  ));
            }
          }),
    );
  }

  void _screenWasClosed() {
    _screenOpened = false;
  }
}

class FoundCodeScreen extends StatefulWidget {
  final String value;
  final Function() screenClosed;
  const FoundCodeScreen({
    Key? key,
    required this.value,
    required this.screenClosed,
  }) : super(key: key);

  @override
  State<FoundCodeScreen> createState() => _FoundCodeScreenState();
}

class _FoundCodeScreenState extends State<FoundCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contenido"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            widget.screenClosed();
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "QR Scaneado:",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                widget.value,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
