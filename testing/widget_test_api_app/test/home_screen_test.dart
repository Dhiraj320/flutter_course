import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_api_app/home_screen.dart';
import 'package:widget_test_api_app/user_model.dart';

void main() {
  testWidgets(
      'Given the list of user when fetches from app then Display list of users with name(title) and email(subtitle)',
      (tester) async {
    // for solve the 2 problem discuss in iunit test also apply here
    final users = [
      User(id: 1, name: 'Rivaan', email: 'rivaan@gmail.com'),
      User(id: 2, name: 'Dhiraj', email: 'dhiraj@gmail.com')
    ];

    // Future<List<User>> mockFetchUsers() async {

    //   return users;
    // }
    // tester.pumpAndSettle() function work
    Future<List<User>> mockFetchUsers() async {
      return Future.delayed(const Duration(seconds: 1), () => users);
    }

    await tester.pumpWidget(MaterialApp(
      home: HomeScreen(
        futureUsers: mockFetchUsers(),
      ),
    ));

    // await tester.pumpWidget(const MaterialApp(
    //     // home: HomeScreen(),

    //     ));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // await tester.pump();
    // expect(find.byType(ListView), findsOneWidget);

    await tester.pumpAndSettle();
    expect(find.byType(ListView), findsOneWidget);

    expect(find.byType(ListTile), findsNWidgets(users.length));


    for (final user in users) {
      expect(find.text(user.name), findsOneWidget);
      expect(find.text(user.email), findsOneWidget);

      
    }
  });
}
