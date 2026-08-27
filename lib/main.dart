import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'qr_scanner.dart';
import 'spotify_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify QR Scanner',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _scanQRCode(BuildContext context) async {
    final String? qrResult = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const QRScanner()),
    );

    if (qrResult != null) {
      final String spotifyUri = extractSpotifyUri(qrResult);
      if (spotifyUri.isNotEmpty) {
        if (context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SpotifyPlayer(spotifyUri: spotifyUri),
            ),
          );
        }
      } else {
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ungültiger Spotify QR-Code')),
          );
        }
      }
    }
  }

  String extractSpotifyUri(String scannedData) {
    if (scannedData.startsWith('spotify:')) {
      return scannedData;
    }

    final Uri? uri = Uri.tryParse(scannedData);
    if (uri == null || !uri.host.contains('spotify.com')) {
      return '';
    }

    final List<String> segments = uri.pathSegments;
    if (segments.length >= 2) {
      final String type = segments[0];
      final String id = segments[1];
      if (type.isNotEmpty && id.isNotEmpty) {
        return 'spotify:$type:$id';
      }
    }

    if (kDebugMode) {
      debugPrint('Invalid Spotify URI in scan result: $scannedData');
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Spotify QR Scanner'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _scanQRCode(context),
          child: const Text('Scan QR Code'),
        ),
      ),
    );
  }
}
