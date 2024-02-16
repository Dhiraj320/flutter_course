import 'package:api_app/user_model.dart';
import 'package:api_app/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  late UserRepository userRepository;
  setUp(() {
    userRepository = UserRepository();
  });
  group('UserRepository -', () {
    group('getUser function -', () {
      test(
          'given UserRepository class when getUser function is called and status code is 200 then userModel should be return',
          () async {
        //Arrange
        // -> done in setUp function
        // Act
        final user = await userRepository.getUser();

        // Assert
        expect(user, isA<User>());
      });

      test(
          'given UserRepository class when getUser function is called and status code is not 200 then exception(Somne error occured) should be thrown',
          () async {
        //Arrange
        // -> done in setUp function
        // Act
        final user = await userRepository.getUser();
        // Assert
        expect(user, throwsException);
      });
    });
  });
}




/*
using mock two problem faced in function test 1) wifi is off, 2)exception case

// Mocking
class MockHTTPClient extends Mock implements Client {}

void main() {
  late UserRepository userRepository;
  late MockHTTPClient mockHTTPClient;
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    userRepository = UserRepository(mockHTTPClient);
  });
  group('UserRepository -', () {
    group('getUser function -', () {
      test(
          'given UserRepository class when getUser function is called and status code is 200 then userModel should be return',
          () async {
        //Arrange
        when(
          () => mockHTTPClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')),
        ).thenAnswer((invocation) async {
          return Response(
              '''
             {
"id": 1,
"name": "Leanne Graham",
"username": "Bret",
"email": "Sincere@april.biz",
"website": "hildegard.org"
}
             
         


             ''',
              200);
        });
        // Act
        final user = await userRepository.getUser();

        // Assert
        expect(user, isA<User>());
      });

      test(
          'given UserRepository class when getUser function is called and status code is not 200 then exception(Somne error occured) should be thrown',
          () async {
        //Arrange
        // -> done in setUp function
        //Stubbing

        when(
          () => mockHTTPClient
              .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1')),
        ).thenAnswer((invocation)async {
          return Response('{}', 500);
        });
        // Act
        
        final user =  userRepository.getUser();
        // Assert
        expect(user, throwsException);
      });
    });
  });
}

*/