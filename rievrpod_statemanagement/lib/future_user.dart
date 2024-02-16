import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

// for futureProvider
// class FutureUser {
//   final String name;
//   final String email;
//   FutureUser({
//     required this.name,
//     required this.email,
//   });

//   FutureUser copyWith({
//     String? name,
//     String? email,
//   }) {
//     return FutureUser(
//       name: name ?? this.name,
//       email: email ?? this.email,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     final result = <String, dynamic>{};

//     result.addAll({'name': name});
//     result.addAll({'email': email});

//     return result;
//   }

//   factory FutureUser.fromMap(Map<String, dynamic> map) {
//     return FutureUser(
//       name: map['name'] ?? '',
//       email: map['email'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory FutureUser.fromJson(String source) =>
//       FutureUser.fromMap(json.decode(source));
// }

// //or if we passing parameter from constructor
// final futureUserRepositoryProvider = Provider((ref) => FutureUserRepository());

// //ProviderRef Code
// class FutureUserRepository {
//   Future<FutureUser> fetchUserData() {
//     const url = "https://jsonplaceholder.typicode.com/users/1";
//     return http
//         .get(Uri.parse(url))
//         .then((value) => FutureUser.fromJson(value.body));
//   }
// }

// For Modifiers Using FutureProvider

class FutureUser {
  final String name;
  final String email;
  FutureUser({
    required this.name,
    required this.email,
  });

  FutureUser copyWith({
    String? name,
    String? email,
  }) {
    return FutureUser(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'email': email});

    return result;
  }

  factory FutureUser.fromMap(Map<String, dynamic> map) {
    return FutureUser(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory FutureUser.fromJson(String source) =>
      FutureUser.fromMap(json.decode(source));
}

// or if we passing parameter from constructor
final futureUserRepositoryProvider = Provider((ref) => FutureUserRepository());

//ProviderRef Code
class FutureUserRepository {
  Future<FutureUser> fetchUserData(String input) {
    var url = "https://jsonplaceholder.typicode.com/users/$input";
    return http
        .get(Uri.parse(url))
        .then((value) => FutureUser.fromJson(value.body));
  }
}
