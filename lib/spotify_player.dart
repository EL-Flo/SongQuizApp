import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class SpotifyPlayer extends StatefulWidget {
  final String spotifyUri;

  const SpotifyPlayer({super.key, required this.spotifyUri});

  @override
  _SpotifyPlayerState createState() => _SpotifyPlayerState();
}

class _SpotifyPlayerState extends State<SpotifyPlayer> {
  String statusMessage = 'Verbinde mit Spotify...';
  bool isConnected = false;

  @override
  void initState() {
    super.initState();
    connectToSpotify();
  }

  @override
  void dispose() {
    // Cleanup: disconnect from Spotify if needed
    SpotifySdk.disconnect();
    super.dispose();
  }

  Future<void> connectToSpotify() async {
    try {
      final bool connected = await SpotifySdk.connectToSpotifyRemote(
        clientId: 'e2223e43a02d44b8b9bd684c1e19da83',
        redirectUrl: 'spotifyqrapp://callback',
      );

      if (!mounted) return;

      if (!connected) {
        setState(() {
          isConnected = false;
          statusMessage = 'Spotify-Verbindung fehlgeschlagen.';
        });
        return;
      }

      setState(() {
        isConnected = true;
        statusMessage = 'Verbunden! Spiele Song...';
      });

      if (kDebugMode) {
        debugPrint('Connected to Spotify');
      }
      await playSong(widget.spotifyUri);
    } catch (e) {
      if (mounted) {
        setState(() {
          statusMessage = 'Fehler beim Verbinden: ${e.toString()}';
        });
      }
      if (kDebugMode) {
        debugPrint('Error connecting to Spotify: $e');
      }
    }
  }

  Future<void> playSong(String uri) async {
    try {
      await SpotifySdk.play(spotifyUri: uri);
      if (mounted) {
        setState(() {
          statusMessage = 'Song wird abgespielt!';
        });
      }
    } catch (e) {
      if (kDebugMode) {
        debugPrint('Error playing song: $e');
      }
      if (mounted) {
        setState(() {
          statusMessage = 'Fehler beim Abspielen: ${e.toString()}';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Spotify Player')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isConnected)
              const CircularProgressIndicator()
            else
              const Icon(Icons.music_note, size: 64, color: Colors.green),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                statusMessage,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
