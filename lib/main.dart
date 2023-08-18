import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_1/Provider/list_provider.dart';
import 'package:state_1/second_page.dart';

import 'Provider/counter_provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CounterProvider(),),
        ChangeNotifierProvider(create: (context) => ListDataProvider(),)
      ],
    child: MyApp(),
  )
  );
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
      body: Consumer<ListDataProvider>(
        builder: (_,provider,___){
          List<Map<String,dynamic>> data=provider.getAllData();
          return ListView.builder(
          itemCount: data.length,
          itemBuilder:(context,index){
           return ListTile(
              title: Text(data[index]['name']),
             subtitle: Text(data[index]["dept"]),
             trailing: IconButton(onPressed:(){
               context.read<ListDataProvider>().deleteData(index);
             },
             icon: Icon(Icons.delete,color: Colors.red,)
             ),
             );
           }
           );
          },

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
        Map<String,dynamic> note={
          "name": "pallavi",
          "dept":"Flutter"
        };
        context.read<ListDataProvider>().addData(note);
        },
        child: Icon(Icons.add,color: Colors.white,),
      ),


    );
  }
}
