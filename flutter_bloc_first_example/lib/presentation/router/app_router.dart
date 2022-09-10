import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first_example/presentation/screens/internet_screen.dart';
import '../screens/settings_screen.dart';
import '/presentation/screens/home_screen.dart';
import '/presentation/screens/second_screen.dart';
import '/presentation/screens/thrid_screen.dart';

import '../../logic/cubit/counter_cubit.dart';

class AppRouter {
  final _counterCubit = CounterCubit();
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
              value: _counterCubit,
              child: const MyHomePage(title: 'Home Screen')),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
              value: _counterCubit,
              child: const SecondScreen(title: 'Second Screen')),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
              value: _counterCubit,
              child: const ThirdScreen(title: 'Third Screen')),
        );
      case '/internet':
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
              value: _counterCubit,
              child: const InternetScreen(
                title: 'Internet Screen',
                color: Colors.green,
              )),
        );
      case '/settings':
        return MaterialPageRoute(
          builder: (_) => SettingsScreen(),
        );
      default:
        return null;
    }
  }

  @override
  void dispose() {
    _counterCubit.close();
  }
}
// Cách 1: Sử dụng BlocProvider.value() để tái sử dụng data cho những màn hình khác nhau
// Sử dụng trong trường hợp 1 đến 2 màn hình xài chung 1 cubit hoặc bloc 

/**
 * 
 * Cách 2:
     class AppRouter {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(title: 'Home Screen'),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (context) => const SecondScreen(title: 'Second Screen'),
        );
      case '/third':
        return MaterialPageRoute(
          builder: (context) => const ThirdScreen(title: 'Third Screen'),
        );
      default:
        return null;
    }
  }
}
    + Dùng để đưa tất cả data local cho toàn bộ màn hình không cần khai báo lại Countercubit
    + Khai báo 1 lần ở main
    + Dùng cho trường hợp 1 cubit hoặc bloc xài cho nhiều màn hình
     ví dụ: Chuyển các text từ home screen qua third screen
 */

