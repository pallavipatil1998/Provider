import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_1/second_page.dart';

import 'Provider/counter_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create:(context) => CounterProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage()
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    print('Home Page Build');
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

              //consumer use for only get value
              Consumer<CounterProvider>(builder: (_,provider,___){
                print('Consumer build');
                return Text(
                  //get [bedefault licen true]
                  // '${Provider.of<CounterProvider>(context).getValue()}',
                  //or
                  // '${ctx.watch<CounterProvider>().getValue()}',
                  //or
                  " ${provider.getValue()}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder:(context) => SecondPage(),));
              },
                  child:Text("Next Page"))
            ],
          ),
        ),
        floatingActionButton:Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: (){
                //set [No need to licen]
                // Provider.of<CounterProvider>(context ,listen: false).decrement();
                context.read<CounterProvider>().decrement();
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: (){
                //set [No need to licen]
                // Provider.of<CounterProvider>(context ,listen: false).increment();
                context.read<CounterProvider>().increment();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ],
        )
    );
  }
}
