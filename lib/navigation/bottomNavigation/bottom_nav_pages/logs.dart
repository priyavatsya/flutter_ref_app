import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  State<LogPage> createState() => _LogPageState();
}

class _LogPageState extends State<LogPage> {

  final _connect= GetConnect();

  void _sentGetRequest() async{
    final response= await _connect.get('https://jsonplaceholder.typicode.com/posts/1');

    if(kDebugMode){
      print(response.body['title']);
    }
  }

  void _sentPostRequest() async{
    final response = await _connect.post(
      'https://jsonplaceholder.typicode.com/posts',{
        'title': 'numbers to be displayed',
      'body': ' 1,2 3,4,5,6,7,8,9,0',
      'userId':'101',
    }
    );

    if(kDebugMode){
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Get/Post API'),
      ),
      body: Padding(
       padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(onPressed: _sentGetRequest,
                child: const Text('Send Get Request  '),
            ),

            SizedBox(height: 20,),

            ElevatedButton(onPressed: _sentPostRequest,
                child: const Text('Send Post Request  '),
            ),
          ],

        ),
      ),
    );
  }
}
