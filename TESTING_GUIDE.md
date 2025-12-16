# Testing Guide for Spotify QR Scanner App

This guide will help you test your Hitster-style music quiz app on your device.

## Prerequisites

### 1. Install Flutter
- **Windows/Mac/Linux**: Follow the official guide at https://docs.flutter.dev/get-started/install
- Run `flutter doctor` in terminal/command prompt to verify installation

### 2. Set Up Your Device

#### Option A: Android Device (Recommended for beginners)
1. Enable Developer Mode on your Android phone:
   - Go to Settings → About Phone
   - Tap "Build Number" 7 times
   - Go back to Settings → Developer Options
   - Enable "USB Debugging"
2. Connect your phone to computer via USB cable
3. Verify connection: Run `flutter devices` in terminal

#### Option B: iOS Device (Mac only)
1. Connect iPhone/iPad via USB
2. Open Xcode and sign in with Apple ID
3. Configure signing in Xcode project settings
4. Run `flutter devices` to verify connection

#### Option C: Emulator/Simulator
- **Android**: Use Android Studio to create a virtual device
- **iOS**: Use Xcode simulator (Mac only)

### 3. Spotify Requirements
- Install Spotify app on your test device
- Have a Spotify Premium account (required for Spotify SDK)
- Log into Spotify on your device

## Running the App

### Step 1: Open Terminal/Command Prompt
Navigate to your app folder:
```bash
cd /path/to/SongQuizApp
```

### Step 2: Get Dependencies
```bash
flutter pub get
```

### Step 3: Check Connected Devices
```bash
flutter devices
```
You should see your connected device or emulator listed.

### Step 4: Run the App
```bash
flutter run
```

This will:
- Build the app (may take 2-5 minutes first time)
- Install it on your device
- Launch the app automatically

### Quick Run Options
- Run on specific device: `flutter run -d <device-id>`
- Run in release mode (faster): `flutter run --release`

## Testing the App Features

### Test 1: App Launches Successfully ✓
**Expected**: App opens showing "Spotify QR Scanner" screen with a "Scan QR Code" button

**If it crashes**: Check the console output for error messages

### Test 2: QR Scanner Opens ✓
1. Tap "Scan QR Code" button
2. **Expected**: Camera view opens with text "Scanne einen Spotify QR-Code"
3. Grant camera permissions if prompted

**If camera doesn't work**: Check device permissions in Settings

### Test 3: Scan a Spotify QR Code ✓
1. Get a Spotify QR code:
   - Open Spotify app
   - Find any song/album/playlist
   - Tap share (•••) → Share → "Song/Album Link" or get QR code
   - Or use Spotify's web player to generate codes
2. Point camera at the QR code
3. **Expected**: App scans code and navigates to player screen

**If scan fails**: Try adjusting distance/lighting, or ensure QR code is valid Spotify code

### Test 4: Song Playback ✓
1. After scanning, observe the player screen
2. **Expected**: 
   - Shows "Verbinde mit Spotify..." (Connecting to Spotify...)
   - Then shows music note icon
   - Shows "Song wird abgespielt!" (Song is playing!)
   - Song plays in Spotify app

**If connection fails**: 
- Ensure Spotify app is installed and you're logged in
- Check that you have Spotify Premium
- Verify client ID in code is valid

### Test 5: Error Handling ✓
1. Scan an invalid/non-Spotify QR code
2. **Expected**: Shows error message "Ungültiger Spotify QR-Code"

### Test 6: Navigation ✓
1. Tap back button on player screen
2. **Expected**: Returns to home screen
3. Can scan another code

## Common Issues and Solutions

### Issue: "Flutter command not found"
**Solution**: Flutter is not installed or not in PATH. Reinstall Flutter and add to PATH.

### Issue: "No devices found"
**Solution**: 
- Ensure device is connected via USB
- Enable USB debugging (Android)
- Run `flutter doctor` to diagnose

### Issue: Camera not working
**Solution**: Grant camera permissions in device Settings → Apps → Spotify QR App → Permissions

### Issue: Spotify connection fails
**Solution**: 
- Must have Spotify Premium (free accounts won't work with SDK)
- Ensure Spotify app is installed and logged in
- Check internet connection

### Issue: "Build failed" errors
**Solution**: 
- Run `flutter clean` then `flutter pub get`
- Check Android SDK is installed (for Android)
- Check Xcode is installed (for iOS)

## Advanced Testing

### Hot Reload (for making quick changes)
- While app is running, press `r` in terminal for hot reload
- Press `R` for hot restart
- Press `q` to quit

### Debug Mode Features
- App runs slower but shows debug banner
- Better error messages in console
- Can inspect widget tree

### Release Mode Testing
```bash
flutter run --release
```
- Faster performance
- No debug features
- Closer to production experience

## Testing Checklist

- [ ] App launches without crashing
- [ ] Scan button opens camera
- [ ] Camera shows QR scanner view
- [ ] Can scan Spotify QR codes
- [ ] App extracts Spotify URI correctly
- [ ] Connects to Spotify successfully
- [ ] Song plays in background
- [ ] Status messages appear correctly
- [ ] Error messages show for invalid codes
- [ ] Can navigate back and scan another code
- [ ] App doesn't crash when backing out during connection
- [ ] App cleans up resources when closing

## Next Steps for Your Hitster Game

To complete the Hitster-style quiz functionality, you'll need to add:

1. **Hide song metadata during playback** - Currently it just plays, need to fetch and hide artist/title
2. **Reveal button** - "Flip the card" to show song information
3. **Quiz UI** - Input fields for guessing artist/title/year
4. **Score tracking** - Keep track of correct guesses
5. **Multiple rounds** - Manage multiple cards/songs in a game session

## Getting Help

If you encounter issues:
1. Check the console output for error messages
2. Run `flutter doctor -v` for detailed diagnostics
3. Search error messages on Google/StackOverflow
4. Check Flutter documentation: https://docs.flutter.dev

## Useful Commands Reference

```bash
# Check Flutter installation
flutter doctor

# List connected devices
flutter devices

# Install dependencies
flutter pub get

# Clean build files
flutter clean

# Run app
flutter run

# Run on specific device
flutter run -d <device-id>

# Build APK (Android)
flutter build apk

# Build iOS app
flutter build ios
```
