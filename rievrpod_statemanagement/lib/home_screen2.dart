import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rievrpod_statemanagement/main.dart';
import 'package:rievrpod_statemanagement/user.dart';

class HomeScreen2 extends ConsumerWidget {
  const HomeScreen2({super.key});

  // void onSubmiited(WidgetRef ref, String value) {
  //   // ref.read(stateProvider.notifier).update((state) => value);
  // }
  void onSubmiitedName(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateName(value);
  }

  void onSubmiitedAge(WidgetRef ref, String value) {
    ref.read(userProvider.notifier).updateAge(int.parse(value));
  }

  //ChangeNotifier
  void onSubmiitedNameChange(WidgetRef ref, String value) {
    ref.read(userChangeNotifierProvider.notifier).updateName(value);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final name = ref.watch(stateProvider) ?? '';
    // final user = ref.watch(userProvider);
    //
    //for select property
    final userSelect = ref.watch(userProvider.select((value) => value.name));
    // changeNotifier
    final user = ref.watch(userChangeNotifierProvider).user;

    // ChangeNotifier is muttable so we can do this
    ref.watch(userChangeNotifierProvider).user = const User(name: '', age: 1);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Column(
        children: [
          //stateNotifier
          // TextField(onSubmitted: (value) => onSubmiitedName(ref, value)),
          // TextField(onSubmitted: (value) => onSubmiitedAge(ref, value)),

          // changeNotifier
          TextField(onSubmitted: (value) => onSubmiitedNameChange(ref, value)),

          Center(
            child: Text(userSelect.toString()),
          )
        ],
      ),
    );
  }
}
