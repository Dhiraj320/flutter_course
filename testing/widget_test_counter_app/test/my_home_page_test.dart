import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_counter_app/my_home_page.dart';

void main() {
  testWidgets(
    'given counter is 0 when incrementing button is clicked then counter should be 1',
    (tester) async {
      // initially when app start the counter is 0 for that this test run
      await tester.pumpWidget(
          const MaterialApp(home: MyHomePage(title: 'Counter App')));
      final counter = find.text('0');
      expect(counter, findsOneWidget);

      final counter1 = find.text('1');
      expect(counter1, findsNothing);

      //when we tap on the floatingaction button the value from 0 to 1 then this test run

      //final incrementBtn = find.byType(FloatingActionButton);
      //or the importance of key
      final incrementBtn = find.byKey(const Key('increment_counter'));
      await tester.tap(incrementBtn);

      await tester.pump();

      final counter3 = find.text('1');
      expect(counter3, findsOneWidget);

      final counter4 = find.text('0');
      expect(counter4, findsNothing);

// for appbar the app bar is present or not
      expect(find.byType(AppBar), findsOneWidget);
    },
  );
}
