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
    final qrResult = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const QRScanner()),
    );

    if (qrResult != null && qrResult is String) {
      String spotifyUri = extractSpotifyUri(qrResult);
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
    try {
      if (scannedData.contains('spotify.com')) {
        Uri uri = Uri.parse(scannedData);
        List<String> segments = uri.pathSegments;
        if (segments.length >= 2) {
          String type = segments[0]; // z.B. 'track', 'album'
          String id = segments[1];
          return 'spotify:$type:$id';
        }
      } else if (scannedData.contains('spotify:')) {
        return scannedData;
      }
    } catch (e) {
      print('Error parsing Spotify URI: $e');
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
