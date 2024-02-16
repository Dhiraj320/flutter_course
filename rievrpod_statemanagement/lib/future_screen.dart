// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:rievrpod_statemanagement/main.dart';

// class FutureScreen extends ConsumerWidget {
//   const FutureScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final user = ref.watch(fetchUserProvider);
//     // user.when(data: (data) {}, error: (error, stackTrace) {}, loading: () {});
//     //or
//     return ref.watch(fetchUserProvider).when(data: (data) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(data.name),
//         ),
//         body: Column(
//           children: [
//             Center(
//               child: Text(data.email),
//             ),
//           ],
//         ),
//       );
//     }, error: (error, stackTrace) {
//       return Scaffold(
//         body: Center(
//           child: Text(error.toString()),
//         ),
//       );
//     }, loading: () {
//       return const Center(
//         child: CircularProgressIndicator(color: Colors.blue),
//       );
//     });
//   }
// }
