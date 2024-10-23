import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'spotify_player.dart';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  bool _isScanning = true;
  MobileScannerController cameraController = MobileScannerController();

  void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
    if (!_isScanning) return;
    final String? code = barcode.rawValue;
    if (code != null && code.contains('spotify.com/track')) {
      setState(() {
        _isScanning = false;
      });
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SpotifyPlayerPage(uri: code),
        ),
      );
    }
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Scanner'),
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: _foundBarcode,
      ),
    );
  }
}
