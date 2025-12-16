# Spotify QR Scanner - Hitster Music Quiz App

A Flutter-based music quiz app inspired by the Hitster board game. Scan Spotify QR codes to play songs and test your music knowledge!

## What This App Does

1. **Scan Spotify QR Codes** - Use your phone's camera to scan QR codes from Spotify
2. **Play Songs** - Automatically plays the scanned song through Spotify
3. **Quiz Game** (planned) - Guess song details before revealing the information

## Quick Start

**New to coding?** Check out the [**TESTING_GUIDE.md**](TESTING_GUIDE.md) for step-by-step instructions on how to test this app on your device.

## Prerequisites

- **Flutter SDK** installed on your computer ([Installation Guide](https://docs.flutter.dev/get-started/install))
- **Spotify Premium account** (required for Spotify SDK)
- **Spotify app** installed on your test device
- Android device with USB debugging enabled OR iOS device (Mac only)

## Setup & Installation

```bash
# 1. Navigate to project folder
cd SongQuizApp

# 2. Install dependencies
flutter pub get

# 3. Connect your device and run
flutter run
```

## Project Structure

```
lib/
├── main.dart           # App entry point and home screen
├── qr_scanner.dart     # QR code scanning functionality
└── spotify_player.dart # Spotify playback integration
```

## Features

✅ **QR Code Scanning** - Built-in camera-based QR scanner
✅ **Spotify Integration** - Connects to Spotify SDK for playback
✅ **Crash-Safe** - Null safety, context checks, and lifecycle management
✅ **Error Handling** - User-friendly error messages
✅ **Multi-Platform** - Works on Android, iOS, Web, Windows, macOS, Linux

## How to Test

See [TESTING_GUIDE.md](TESTING_GUIDE.md) for detailed testing instructions.

## Roadmap

- [x] QR code scanning
- [x] Spotify song playback
- [ ] Hide song metadata during playback
- [ ] Reveal button to show song info
- [ ] Guessing interface
- [ ] Score tracking
- [ ] Multiple rounds/game sessions

## Technologies Used

- **Flutter** - Cross-platform framework
- **qr_code_scanner** - QR scanning functionality
- **spotify_sdk** - Spotify playback integration
- **Dart** - Programming language

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Camera not working | Grant camera permissions in device settings |
| Spotify won't connect | Ensure Spotify Premium and app is installed |
| Build errors | Run `flutter clean` then `flutter pub get` |
| No devices found | Enable USB debugging (Android) or connect device |

For more help, see [TESTING_GUIDE.md](TESTING_GUIDE.md) or run `flutter doctor`.

## Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Spotify for Developers](https://developer.spotify.com/)
- [QR Code Scanner Package](https://pub.dev/packages/qr_code_scanner)
- [Hitster Board Game](https://www.hitster.app/) (inspiration)

## License

This project is for educational and personal use.
