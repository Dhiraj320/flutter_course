import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';

class ModifiersScreen extends ConsumerStatefulWidget {
  const ModifiersScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ModifiersScreenState();
}

class _ModifiersScreenState extends ConsumerState<ModifiersScreen> {
  String userNo = '1';
  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchUserProvider(userNo)).when(data: (data) {
      return Scaffold(
        appBar: AppBar(
          title: Text(data.name),
        ),
        body: Column(
          children: [
            TextField(
              onSubmitted: (value) => setState(() {
                userNo = value;
              }),
            ),
            // Center(
            //   child: Text(data.email),
            // ),
          ],
        ),
      );
    }, error: (error, stackTrace) {
      return Scaffold(
        body: Center(
          child: Text(error.toString()),
        ),
      );
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator(color: Colors.blue),
      );
    });
  }
}
