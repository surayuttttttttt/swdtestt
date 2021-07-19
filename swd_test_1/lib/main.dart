import 'package:flutter/material.dart';

void main() =>runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme:ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        ),
    home: MyApp(),
  ));


class MyApp extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List todos = [];
  String input = "";
  @override
  void initState(){
    super.initState();
    todos.add("Shopping");
    todos.add("Water the tree");
    todos.add("Clean a kitchen");
    todos.add("Pet a dog");
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todos App by Surayut"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:(){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                    title: Text("Add Todolist"),
                    content: TextField(
                      onChanged: (String value){
                        input = value;
                      },
                    ),
                  actions: <Widget>[
                    FlatButton(onPressed: (){
                      setState(() {
                        todos.add(input);
                      });
                      Navigator.of(context).pop();
                    }, child: Text("Submit"))
                  ],

                );
              });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (BuildContext context,int index) {
            return Dismissible(
                key: Key(todos[index]),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.all(8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  child: ListTile(
                    title:Text(todos[index]),

                  ),

            ));
          }),
    );

  }
}



