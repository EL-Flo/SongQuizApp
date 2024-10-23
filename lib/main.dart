import 'package:flutter/material.dart';
import 'qr_scanner.dart';
import 'spotify_player.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify QR Scanner',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Future<void> _scanQRCode(BuildContext context) async {
    final qrResult = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => QRScanner()),
    );

    if (qrResult != null) {
      String spotifyUri = extractSpotifyUri(qrResult);
      if (spotifyUri.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SpotifyPlayer(spotifyUri: spotifyUri),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ungültiger Spotify QR-Code')),
        );
      }
    }
  }

  String extractSpotifyUri(String scannedData) {
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
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spotify QR Scanner'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _scanQRCode(context),
          child: Text('Scan QR Code'),
        ),
      ),
    );
  }
}
