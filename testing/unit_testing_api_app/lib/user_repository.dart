import 'package:http/http.dart' as http;

import 'user_model.dart';

class UserRepository {
  Future<User> getUser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }
    throw Exception('Somne error occured');
  }
}

/*

using mock two problem faced in function test 1) wifi is off, 2)error(500,404 status code) case

class UserRepository {
  final http.Client client;
  UserRepository(this.client);

  Future<User> getUser() async {
    final response = await client
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    if (response.statusCode == 200) {
      return User.fromJson(response.body);
    }
    throw Exception('Somne error occured');
  }
}
*/
