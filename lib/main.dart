import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_1/Provider/list_provider.dart';
import 'package:state_1/second_page.dart';

import 'Provider/counter_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => CounterProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => ListDataProvider(),
      )
    ],
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
        home: MyHomePage());
  }
}

class MyHomePage extends StatelessWidget {
  var nameController = TextEditingController();
  var deptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Home Page Build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Consumer<ListDataProvider>(
        builder: (_, provider, ___) {
          List<Map<String, dynamic>> data = provider.getAllData();
          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (ctx, index) {
                return InkWell(
                  onTap: () {
                    nameController.text = data[index]["name"];
                    deptController.text = data[index]["dept"];

                    showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Container(
                            margin: EdgeInsets.all(15),
                            height: 400,
                            color: Colors.cyan.shade200,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Update Information"),
                                TextField(
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      hintText: "Enter Name",
                                      label: Text("Name"),
                                      border: OutlineInputBorder()),
                                ),
                                TextField(
                                  controller: deptController,
                                  decoration: InputDecoration(
                                      hintText: "Enter department",
                                      label: Text("Dept"),
                                      border: OutlineInputBorder()),
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      var info = {
                                        "name": nameController.text.toString(),
                                        "dept": deptController.text.toString()
                                      };
                                      context
                                          .read<ListDataProvider>()
                                          .update(index, info);
                                      Navigator.pop(context);
                                    },
                                    child: Text("Update")),
                              ],
                            ),
                          );
                        });
                  },
                  child: ListTile(
                    title: Text('${data[index]['name']}'),
                    subtitle: Text('${data[index]["dept"]}'),
                    trailing: IconButton(
                        onPressed: () {
                          context.read<ListDataProvider>().deleteData(index);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (_) {
                return Container(
                  margin: EdgeInsets.all(15),
                  height: 400,
                  color: Colors.grey.shade300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Add Information"),
                      TextField(
                          controller: nameController,
                          decoration: InputDecoration(
                              label: Text("Name"),
                              hintText: "Enter Name here",
                              border: OutlineInputBorder())),
                      TextField(
                          controller: deptController,
                          decoration: InputDecoration(
                              hintText: "Enter Department",
                              label: Text("Dept"),
                              border: OutlineInputBorder())),
                      ElevatedButton(
                        onPressed: () {
                          var info2 = {
                            "name": nameController.text.toString(),
                            "dept": deptController.text.toString()
                          };
                          context.read<ListDataProvider>().addData(info2);
                          Navigator.pop(context);
                          nameController.clear();
                          deptController.clear();
                        },
                        child: Text("Add"),
                      ),
                    ],
                  ),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

/* Map<String,dynamic> note={
    "name": "pallavi",
    "dept":"Flutter"
  };
  context.read<ListDataProvider>().addData(note);
},*/
