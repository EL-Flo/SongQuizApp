// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:spotify_qr_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that app title is present.
    expect(find.text('Spotify QR Scanner'), findsOneWidget);
    
    // Verify that the scan button is present.
    expect(find.text('Scan QR Code'), findsOneWidget);
    
    // Verify that the button is an ElevatedButton.
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
  
  testWidgets('HomePage has correct structure', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: HomePage()));

    // Verify that HomePage has an AppBar with correct title.
    expect(find.widgetWithText(AppBar, 'Spotify QR Scanner'), findsOneWidget);
    
    // Verify that the scan button exists.
    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
