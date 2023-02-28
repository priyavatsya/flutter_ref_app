import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'addPage.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List items=[];
  bool isLoading= true;

  @override
  void initState(){
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Call'),
      ),
      body: RefreshIndicator(
        onRefresh: fetchTodo,
        backgroundColor: Colors.white,
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index){
              final item= items[index] as Map;
              final id = item['_id'] as String;
              return ListTile(
                leading: CircleAvatar(child: Text('${index+1}')),
                title: Text(item['title']),
                //subtitle: Text(item['description']),
                //subtitle: Text(item['description']),
                trailing: PopupMenuButton(
                  onSelected: (value) {
                    if (value == 'edit') {
                      navigateToEditPage(item);

                    } else if (value == ' delete') {
                      deleteById(id);
                    }
                  },

                  itemBuilder: (context){
                    return[
                      PopupMenuItem(child: Text('Edit'),
                      value: 'edit'
                      ),

                      PopupMenuItem(child: Text('Delete'),
                      value: 'delete',
                      ),
                    ];
                  },
                ),
              );
            },

          ),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: navigateToAddPage,
        label:Text('Todo List'),
      ),
    );

  }

  Future<void> navigateToEditPage(Map item) async{
    final route= MaterialPageRoute(builder: (context)=> AddPage(todo:item),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> navigateToAddPage() async{
    final route= MaterialPageRoute(builder: (context)=> AddPage(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

//_______________GET-----------------
  Future<void> fetchTodo() async{
    final url= "http://api.nstack.in/v1/todos?page=1&limit=10";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if(response.statusCode== 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items= result;
      });
    }

    setState(() {
      isLoading= false;
    });
  }

  // Delete

  Future<void> deleteById(String id) async {
    final url = "http://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final filtered = items.where((element) => element['7id'] != id).toList();

      setState(() {
        items = filtered;
      });
    }
  }
}
