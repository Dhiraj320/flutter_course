import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_testing_login_app/home_screen.dart';
import 'package:integration_testing_login_app/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end to end test', () {
    testWidgets(
        'given the textfield data when enter the data then verify login screen with correct username and password',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2)); // for watching the testing by internally
      await tester.enterText(find.byType(TextFormField).at(0), 'username');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(1), 'password');
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.byType(ElevatedButton));
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle(); // for transition to another screeen
      await Future.delayed(const Duration(seconds: 2));

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets(
        'given the textfield data when enter the wrong  data then verify login screen with wrong username and password and show alert dialog',
        (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await Future.delayed(const Duration(seconds: 2)); // for watching the testing by internally
      await tester.enterText(find.byType(TextFormField).at(0), 'dhiraj');
      await Future.delayed(const Duration(seconds: 2));
      await tester.enterText(find.byType(TextFormField).at(1), 'dhiraj123');
      await Future.delayed(const Duration(seconds: 2));
      await tester.tap(find.byType(ElevatedButton));
      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle(); // for transition to another screeen
      await Future.delayed(const Duration(seconds: 2));

      expect(find.byType(AlertDialog), findsOneWidget);
    });
  });
}
