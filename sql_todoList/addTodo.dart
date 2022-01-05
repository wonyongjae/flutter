import 'package:flutter/material.dart';
import 'package:sqflite/sqlite_api.dart';
import 'todo.dart';

class AddTodoApp extends StatefulWidget {
  // const AddTodoApp(Future<Database> database, {Key? key}) : super(key: key);
  final Future<Database> db;
  const AddTodoApp(this.db);

  @override
  _AddTodoAppState createState() => _AddTodoAppState();
}

class _AddTodoAppState extends State<AddTodoApp> {
  TextEditingController? titleController;
  TextEditingController? contentController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo 추가'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: '제목'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextField(
                  controller: contentController,
                  decoration: const InputDecoration(labelText: '할일'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Todo todo = Todo(
                        title: titleController!.value.text,
                        content: contentController!.value.text,
                        active: 0);
                    Navigator.of(context).pop(todo);
                  },
                  child: const Text('저장하기'))
            ],
          ),
        ),
      ),
    );
  }
}
