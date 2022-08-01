import 'package:flutter/material.dart';
import 'package:todo_app/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData.light(),
      home: const MyHomePage(title: 'ToDo App'),
    );
  }
}

//class model for todo
class todo_list {
  String title;
  String description;
  todo_list(this.title, this.description);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Retrieving user input
  List<todo_list> _todoList = <todo_list>[];

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  void _addTodoItem() {
    String titleText = titleController.text;
    String descriptionText = descriptionController.text;
    setState(() {
      _todoList.add(todo_list(titleText, descriptionText));

      // _todoList.add(descriptionText);

      // String userInput = <String> [] as String;
    });
    print(_todoList[0].title);
  }

  // void dispose() {
  //   myController.dispose();
  //   super.dispose();
  // }

  // Widget _buildTodoItem(String title) {
  //   return ListTile(title: Text(title));
  // }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: Colors.blueAccent,
            width: 3,
          )
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the title',
                  ),
                  controller: titleController,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the description',
                  ),
                  controller: descriptionController,
                ),
              ),
              FloatingActionButton(
                  child: Text(
                      'Save',
                  ),
                  onPressed: _addTodoItem,
              )
            ],
          ),
          ListView.separated(
            physics: ClampingScrollPhysics(),
            // scrollDirection: Axis.horizontal,
            // reverse: true,
            padding: EdgeInsets.all(16.0),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: colorCodes[index % 3],
                child: Center(child: Text('$index ${entries[index]}')),
              );
            },
            separatorBuilder: (BuildContext context, int index) => const Divider(),
        )
      ),
    );
   }
}
