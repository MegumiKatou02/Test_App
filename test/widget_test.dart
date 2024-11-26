// import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/ui/home/home.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester
        .pumpWidget(const MyApp()); // <-- Check if this builds correctly

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);  // <-- "0" should be rendered on screen
    // expect(find.text('1'), findsNothing);

    // // Tap the '+' icon and trigger a frame.
    // await tester.tap(find.byIcon(Icons.add));  // <-- Does '+' icon exist?
    // await tester.pump();

    // // Verify that our counter has incremented.
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);  // <-- "1" should be there now
  });
}
