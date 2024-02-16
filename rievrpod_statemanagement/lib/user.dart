import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@immutable
class User {
  final String name;
  final int age;
  const User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'name': name});
    result.addAll({'age': age});

    return result;
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] ?? '',
      age: map['age']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User && other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

//StateNotifier
class UserNotifier extends StateNotifier<User> {
  // UserNotifier(super.state);
  //or
  // UserNotifier() : super(const User(name: '', age: 0));
  //or for running constructor
  UserNotifier() : super(const User(name: '', age: 0)) {
    updateName('aaaaa');
  }

  void updateName(String n) {
    state = state.copyWith(name: n);
  }

  void updateAge(int a) {
    state = state.copyWith(age: a);
  }
}

// ChangeNotifier
class UserNotifierChange extends ChangeNotifier {
  User user = const User(name: '', age: 0);
  void updateName(String n) {
    user = user.copyWith(name: n);
    notifyListeners();
  }

  void updateAge(int a) {
    user = user.copyWith(age: a);
    notifyListeners();
  }
}
