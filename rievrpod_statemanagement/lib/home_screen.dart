import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rievrpod_statemanagement/main.dart';

// 1stway ref.eatch i) way for nstateless widget
// class HomeScreen extends ConsumerWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final name = ref.watch(nameProvider);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//       ),
//       body: Column(
//         children: [
//           Center(
//             child: Text(name),
//           )
//         ],
//       ),
//     );
//   }
// }

// ii) way
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Consumer(builder: (context, ref, child) {
//         final name = ref.watch(nameProvider);
//         return Column(
//           children: [
//             Center(
//               child: Text(name),
//             )
//           ],
//         );
//       }),
//     );
//   }
// }

// for statefulwidget

// class HomeScreen extends ConsumerStatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   ConsumerState<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends ConsumerState<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final name = ref.watch(nameProvider);

//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(
//         children: [
//           Center(
//             child: Text(name),
//           )
//         ],
//       ),
//     );
//   }
// }
