// import 'dart:convert';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
// class AddPage extends StatefulWidget {
//   const AddPage({Key? key}) : super(key: key);
//
//   @override
//   State<AddPage> createState() => _AddPageState();
// }
//
// class _AddPageState extends State<AddPage> {
//
//   TextEditingController titleContoller = TextEditingController();
//   TextEditingController descController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Todo Lists'),
//       ),
//       body: ListView(
//         padding: EdgeInsets.all(12.0),
//         children: [
//           TextField(
//       controller: titleContoller,
//             decoration: InputDecoration(
//               hintText: "Title",
//             ),
//           ),
//     SizedBox(height:20),
//
//     TextField(
//       controller: descController,
//     decoration: InputDecoration(
//     hintText: "Description"),
//       keyboardType: TextInputType.multiline,
//       minLines: 1,
//       maxLines: 5,
//     ),
//
//           SizedBox(height: 20),
//
//           ElevatedButton(onPressed: submitData,
//               child:Text('Submit', style: TextStyle(
//                 fontSize: 12,
//                 fontWeight: FontWeight.bold,
//               ),)
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> submitData() async {
//     final title = titleContoller.text;
//     final desc = descController.text;
//     final body = {
//       "title": title,
//       "desc": desc,
//       "is_completed": false
//     };
//
//     final url = "https://api.nstack.in/v1/todos";
//     final uri = Uri.parse(url);
//     final response = await http.post(uri,
//       body: jsonEncode(body),
//       headers: {
//         'Content-Type': 'application/json'},
//
//     );
//
//     if (response.statusCode == 201) {
//       titleContoller.text='';
//       descController.text='';
//      // print('Success');
//       showSuccessMessage('Creation Successeful');
//     }
//     else {
//      // print("Failed");
//       showErrorMessage("Creation Failed");
//     }
//   }
//     void showSuccessMessage (String message){
//       final snackBar = SnackBar(content: Text(message));
//       ScaffoldMessenger.of(context).showSnackBar(snackBar);
//     }
//
//   void showErrorMessage (String message){
//     final snackBar = SnackBar(content: Text(message,
//     style: TextStyle(
//       color: Colors.white,
//     ),),
//     backgroundColor: Colors.red
//     );
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
//
//
// }
