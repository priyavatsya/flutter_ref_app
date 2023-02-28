import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddPage extends StatefulWidget {
  final Map? todo;
  const AddPage({super.key, this. todo});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

  TextEditingController titleController= TextEditingController();
  TextEditingController descriptionController= TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    if(widget.todo != null)
      {
        isEdit= true;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              hintText: 'Title',
            ),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 3,
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: submitData,
            child: Text(
              'Submit',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> updateData() async{
    final todo=widget.todo;
    if(todo== null){
      print('add data first');
      return;
    }
    final id= todo['_id'];
    final title= titleController.text;
    final description= descriptionController.text;
    final body= {
      "title": title,
      "description": description,
      "is_completed": false
    };

    //updated data to server
    final url="http://api.nstack.in/v1/todos/$id";
    final uri= Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body),
        headers: {
          'Content-Type': 'application/json',
        }
    );

    if(response.statusCode == 201){
      titleController.text='';
      descriptionController.text='';

      showSuccessMessage('Creation Successeful');
    }
    else{
      showErrorMessage("Creation Failed");
    }
  }

  Future <void> submitData() async{

    final title= titleController.text;
    final desc= descriptionController.text;
    final body= {
      "title": title,
      "desc": desc,
      "is_completed": false
    };

    //Submit data to server
    final url="http://api.nstack.in/v1/todos";
    final uri= Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body),
      headers: {
      'Content-Type': 'application/json',
      }
    );

    if(response.statusCode == 201){
      titleController.text='';
      descriptionController.text='';

      showSuccessMessage('Creation Successeful');
          }
    else{
      showErrorMessage("Creation Failed");
    }
  }

  void showSuccessMessage (String message){
    final snackBar = SnackBar(content: Text(message),
        backgroundColor: Colors.lightBlueAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage (String message){
    final snackBar = SnackBar(content: Text(message,
      style: TextStyle(
        color: Colors.white,
      ),),
        backgroundColor: Colors.red
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }




}
