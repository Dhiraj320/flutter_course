import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget_test_animation_app/animation_screen.dart';

void main() {
  testWidgets('Animation screen ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: AnimationScreen()),
    );

 //for this the updated container is Animation Screen ke widget ka Container one
    //lets test the property of Container()
    var containerFinder = find.byType(Container);
    expect(containerFinder, findsOneWidget);
    var container = tester.widget<Container>(containerFinder);

    //initial value of property
    expect(container.constraints!.minWidth, 50);
    expect(container.constraints!.minHeight, 50);
    expect((container.decoration as BoxDecoration).color, Colors.blue);
    expect((container.decoration as BoxDecoration).borderRadius,
        BorderRadius.zero);

    
    
    // for this the updated container is previous one
    //final value of property
    await tester.pumpAndSettle();
    containerFinder=find.byType(Container);
    container=tester.widget<Container>(containerFinder);
    expect(container.constraints!.maxWidth, 200);
    expect(container.constraints!.maxHeight, 200);
    expect((container.decoration as BoxDecoration).color, Colors.green);
    expect((container.decoration as BoxDecoration).borderRadius, BorderRadius.circular(50));
  });
}
