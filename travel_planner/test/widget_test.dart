import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:travel_planner/login_screen.dart'; // Adjust the import as needed

void main() {
  testWidgets('LoginScreen has a logo, text fields, and buttons',
      (WidgetTester tester) async {
    // Build the LoginScreen widget.
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Verify the logo is present.
    expect(find.byType(Image), findsOneWidget);

    // Verify the text fields are present.
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Verify the login button is present.
    expect(find.text('Login'), findsOneWidget);

    // Verify the Google login button is present.
    expect(find.text('Google'), findsOneWidget);

    // Verify the terms and conditions text is present.
    expect(find.textContaining('By clicking continue'), findsOneWidget);

    // Interact with the text fields and buttons.
    await tester.enterText(find.byType(TextFormField).at(0), 'testuser');
    await tester.enterText(find.byType(TextFormField).at(1), 'password');
    await tester.tap(find.text('Login'));
    await tester.pump(); // Rebuild the widget after the state has changed.

    // Verify form validation.
    expect(find.text('Please enter your name'), findsNothing);
    expect(find.text('Please enter your password'), findsNothing);
  });
}
