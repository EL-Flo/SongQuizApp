import 'package:flutter/material.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'package:spotify_sdk/models/player_state.dart';

class SpotifyPlayer extends StatefulWidget {
  final String spotifyUri;

  SpotifyPlayer({required this.spotifyUri});

  @override
  _SpotifyPlayerState createState() => _SpotifyPlayerState();
}

class _SpotifyPlayerState extends State<SpotifyPlayer> {
  @override
  void initState() {
    super.initState();
    connectToSpotify();
  }

  Future<void> connectToSpotify() async {
    try {
      var result = await SpotifySdk.connectToSpotifyRemote(
        clientId: 'e2223e43a02d44b8b9bd684c1e19da83',
        redirectUrl: 'spotifyqrapp://callback',
      );
      print('Connected to Spotify: $result');
      playSong(widget.spotifyUri);
    } catch (e) {
      print('Error connecting to Spotify: $e');
    }
  }

  Future<void> playSong(String uri) async {
    try {
      await SpotifySdk.play(spotifyUri: uri);
    } catch (e) {
      print('Error playing song: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Spotify Player')),
      body: Center(
        child: Text('Spiele Song...'),
      ),
    );
  }
}
