import 'package:flutter/material.dart';

class SecondDetail extends StatelessWidget {
  // const SecondDetail({Key? key}) : super(key: key);
  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(controller.value.text);
                },
                child: Text('Todo 저장하기'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
