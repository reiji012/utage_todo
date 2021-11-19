import 'package:flutter/material.dart';
import 'package:utage_todo/todo_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<TodoModel> list = [
    TodoModel('パン'),
    TodoModel('タオル'),
  ];

  /// todoを追加
  void addTodo(String text) {
    setState(() {
      final newToto = TodoModel(text);
      list.add(newToto);
    });
  }

  /// todoを削除
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
          return Card(
            color: Colors.lightBlueAccent,
            child: ListTile(
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  removeTodo(index);
                },
                icon: const Icon(
                  Icons.close_rounded,
                  color: Colors.redAccent,
                ),
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
                    child: const Text('追加'),
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
