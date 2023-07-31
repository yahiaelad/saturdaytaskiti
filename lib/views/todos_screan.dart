import 'package:flutter/material.dart';
import 'package:flutterpro/models/todos.dart';
import 'package:flutterpro/services/todos_services.dart';

class todosscrean extends StatefulWidget {
  const todosscrean({super.key});

  @override
  State<todosscrean> createState() => _todosscreanState();
}

class _todosscreanState extends State<todosscrean> {
  List<Todosmodel> todos = [];
  bool isloading = true;
  gettodosfromapi() async {
    todos = await todos_services().get_todos();
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettodosfromapi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("Todos"),
          centerTitle: true,
        ),
        body: isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: todos.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(todos[index].title ?? "no data"),
                  );
                },
              ));
  }
}
