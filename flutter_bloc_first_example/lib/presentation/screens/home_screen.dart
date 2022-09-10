import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_first_example/presentation/screens/second_screen.dart';

import '../../logic/cubit/counter_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.pushNamed(context, '/settings');
              }),
              icon: const Icon(Icons.settings))
        ],
      ),
      body: BlocListener<CounterCubit, CounterState>(
        listener: (context, state) {
          if (state.wasIncremented == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Increment!"),
                duration: Duration(
                  seconds: 1,
                ),
              ),
            );
          } else if (state.wasIncremented == false) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Decrement!"),
                duration: Duration(
                  seconds: 1,
                ),
              ),
            );
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  if (state.counterValue! < 0) {
                    return Text(
                      'BRR,NEGATIVE${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue! % 2 == 0) {
                    return Text(
                      'YAYYY${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else if (state.counterValue == 5) {
                    return Text(
                      'This is number 5? ${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  } else {
                    return Text(
                      state.counterValue.toString(),
                      style: Theme.of(context).textTheme.headline4,
                    );
                  }
                },
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FloatingActionButton(
                      heroTag: 'btn4',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                        //context.bloc<CounterCubit>().decrement;
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      heroTag: 'btn3',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<CounterCubit>(context),
                        child: const SecondScreen(title: 'Second Screen'),
                      ),
                    ),
                  );
                },
                color: Colors.blue,
                child: const Text('Go to second screen'),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
                color: Colors.blue,
                child: const Text('Go to Thrid screen'),
              ),
              const SizedBox(
                height: 24,
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/internet');
                },
                color: Colors.green,
                child: const Text('Go to Internet screen'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
