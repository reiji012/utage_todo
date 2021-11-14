import 'package:flutter/material.dart';
import 'package:utage_todo/todo_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<TodoModel> list = [
    TodoModel('バナナ'),
    TodoModel('りんご'),
  ];

  /// todoを追加
  void addTodo(String text) {
    setState(() {
      final newToto = TodoModel(text);
      list.add(newToto);
    });
  }

  /// todoを追加
  void removeTodo(int index) {
    setState(() {
      list.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDoリスト'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: list[index].isDone,
              onChanged: (bool? value) {
                setState(() {
                  list[index].isDone = !list[index].isDone;
                });
              },
            ),
            title: Text(
              list[index].title,
            ),
            trailing: IconButton(
              onPressed: () {
                removeTodo(index);
              },
              icon: const Icon(
                Icons.delete_forever,
                color: Colors.red,
              ),
            ),
          );
        },
        itemCount: list.length,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              var input = '';
              return AlertDialog(
                title: const Text('ToDo追加'),
                content: TextField(
                  onChanged: (text) {
                    input = text;
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      if (input.isNotEmpty) {
                        addTodo(input);
                      }
                      Navigator.of(context).pop();
                    },
                    child: Text('追加'),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
