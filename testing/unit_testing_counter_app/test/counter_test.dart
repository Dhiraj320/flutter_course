import 'package:flutter_test/flutter_test.dart';
import 'package:unit_testing_counter_app/counter.dart';

void main() {
  late Counter counter;


  // setUp is called before the every test,
// setUp --> test --> setUp --> test .......
  // setUpAll is called before the all tests,
  // setUpAll --> test --> test .......
  setUp(() {
    counter = Counter();
  });

  setUpAll(() {});

  // given when then --> test descriptions should follow this rule

  group('Counter Class -', () {
    test(
        'given counter class when it is instantiated then value of count should be 0 ',
        () {
      //Arrange

      //Act
      final val = counter.count;
      //Assert
      expect(val, 0);
    });

    test(
        "given counter class when it is incremented then value of count should be 1",
        () {
      //Arrange
// here code we write in setUp function because it common for all function
      //Act
      counter.incrementCounter();
      final val = counter.count;
      //Assert
      expect(val, 1);
    });

    test('given counter class when it is reset then value of count should be 0',
        () {
      //Act
      counter.reset();
      final val = counter.count;
      //Assert
      expect(val, 0);
    });

    test(
        "given counter class when it is decremented then value of count should be -1",
        () {
      //Act
      counter.decrementCounter();
      final val = counter.count;
      //Assert
      expect(val, -1);
    });
  });

  tearDown(() {});
  //test --> tearDown --> test --> tearDown  ...
  tearDownAll(() {});
  //test --> test --> tearDownAll

}
