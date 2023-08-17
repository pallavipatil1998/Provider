import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'counter_provider.dart';
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                //get [bedefault licen true]
                '${Provider.of<CounterProvider>(context).getValue()}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: (){
                //set [No need to licen]
                Provider.of<CounterProvider>(context ,listen: false).decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: (){
                //set [No need to licen]
                Provider.of<CounterProvider>(context ,listen: false).increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        )
    );;
  }
}
