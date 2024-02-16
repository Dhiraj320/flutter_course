import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rievrpod_statemanagement/future_user.dart';
import 'package:rievrpod_statemanagement/logger_riverpod.dart';
import 'package:rievrpod_statemanagement/stream_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
// import 'home_screen.dart';
// import 'home_screen2.dart';
import 'future_screen.dart';
//import 'home_screen2.dart';
import 'modifiers_screen.dart';
import 'user.dart';
// riverpod generator and annotation
part 'main.g.dart';

// riverpod generator and annotation

@riverpod
Future<FutureUser> fetchUser(FetchUserRef ref, String input) {
  final futureUserRepository = ref.watch(futureUserRepositoryProvider);
  return futureUserRepository.fetchUserData(input);
}

// For Modifiers Using FutureProvider
// final fetchUserProvider =
//     FutureProvider.family.autoDispose((ref, String input) {
//   final futureUserRepository = ref.watch(futureUserRepositoryProvider);
//   return futureUserRepository.fetchUserData(input);
// });

//for FutureProvider
// final fetchUserProvider = FutureProvider((ref) {
//   // const url = "https://jsonplaceholder.typicode.com/users";
//   // return http
//   //     .get(Uri.parse(url))
//   //     .then((value) => FutureUser.fromJson(value.body));

//   //ProviderRef Code
//   // return FutureUserRepository().fetchUserData();
//   //or if we passing parameter from constructor
//   final futureUserRepository = ref.watch(futureUserRepositoryProvider);
//   return futureUserRepository.fetchUserData();
// });

// streamProvider
final streamProvider = StreamProvider((ref) async* {
  yield [1, 2, 3, 4, 5, 6, 7];
});

void main() {
  runApp(ProviderScope(

      // ProviderObserver use
      observers: [
        LoggerRiverpod(),
      ],
      child: const MyApp()));
}

// 1) Provider
//final nameProvider = Provider<String>((ref) => 'Dhiraj Kumawat');
//2) StateProvider
//final stateProvider = StateProvider<String?>((ref) => null);
//UserNotifier is class and User is his state
final userProvider = StateNotifierProvider<UserNotifier, User>(
    // (ref) => UserNotifier(const User(name: '', age: 0))
    //or
    (ref) => UserNotifier());

//changeNotifier
final userChangeNotifierProvider =
    ChangeNotifierProvider((ref) => UserNotifierChange());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const ModifiersScreen(),
    );
  }
}
