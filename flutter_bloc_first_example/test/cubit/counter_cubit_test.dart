// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_bloc_first_example/cubit/counter_cubit.dart';
// import 'package:flutter_test/flutter_test.dart';

// void main() {
//   group('CounterCubit', () {
//     CounterCubit? counterCubit;
//     //setUp() đăng ký funtion trước khi chạy test
//     setUp(
//       () {
//         counterCubit = CounterCubit();
//       },
//     );
//     //tearDown()
//     tearDown(
//       () {
//         counterCubit!.close();
//       },
//     );
//     test(
//       'the initial state for the CounterCubit is CounterState(counterValue = 0)',
//       () {
//         expect(counterCubit!.state,
//             CounterState(counterValue: 0, wasIncremented: false));
//       },
//     );

//     blocTest(
//       'the cubit should emit a CounterState(counterValue:1,wasIncremented:1) when cubit.increment() function is called',
//       build: () => counterCubit!,
//       act: (cubitt) => CounterCubit().increment(),
//       expect: () => CounterState(counterValue: 1, wasIncremented: false),
//     );
//   });
// }
