import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_api_flutter_app/api/todo_api_controller.dart';
import 'package:test_api_flutter_app/model/todos_model.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  List<TodosModel> todoList = [];
  getData() async {
    await FullAPIController().getTodoList().then((value) {
      setState(() {
        todoList = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            child: CheckboxListTile(
              selectedTileColor: Colors.black12,
              title: Text(todoList[index].title.toString()),
              subtitle: const Text('Practice Flutter Widget'),
              value: todoList[index].completed,
              onChanged: (value) {
                setState(() {
                  todoList[index].completed = value;
                });
              },
            ),
          );
        },
      ),
    );
  }
}
