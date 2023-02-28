// import 'package:flutter/material.dart';
// import 'package:http/http.dart';
//
// import '../http_methods_crud/app_button.dart';
// import '../http_methods_crud/base_client.dart';
// import '../http_methods_crud/user.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const FlutterLogo(size: 72),
//               AppButton(
//                 operation: 'GET',
//                 operationColor: Colors.lightGreen,
//                 description: 'Fetch users',
//                 onPressed: () async {
//                   var response = await BaseClient().get('/users').catchError((err) {});
//                   if (response == null) return;
//                   debugPrint('successful:');
//
//                   var users = userFromJson(response);
//                   debugPrint('Users count: ' + users.length.toString());
//                 },
//               ),
//               AppButton(
//                 operation: 'POST',
//                 operationColor: Colors.lightBlue,
//                 description: 'Add user',
//                 onPressed: () async {
//                   var user = UserModel(
//                     email: 'xyz@abc.com',
//                       firstName: 'Package',
//                       lastName: 'Flutter',
//
//                     id: null, avatar: '',
//                   );
//
//                   var response = await BaseClient().post('/users', user).catchError((err) {});
//                   if (response == null) return;
//                   debugPrint('successful:');
//                 },
//               ),
//               AppButton(
//                 operation: 'PUT',
//                 operationColor: Colors.orangeAccent,
//                 description: 'Edit user',
//                 onPressed: () async {
//                   var id = 2;
//                   var user = UserModel(
//                     email: 'xyz@flutter.com',
//                     firstName: 'Package',
//                     lastName: 'Flutter',
//
//                     id: null, avatar: '',
//                   );
//
//                   var response = await BaseClient().put('/users/$id', user).catchError((err) {});
//                   if (response == null) return;
//                   debugPrint('successful:');
//                 },
//               ),
//               AppButton(
//                 operation: 'DEL',
//                 operationColor: Colors.red,
//                 description: 'Delete user',
//                 onPressed: () async {
//                   var id = 2;
//                   var response = await BaseClient().delete('/users/$id').catchError((err) {});
//                   if (response == null) return;
//                   debugPrint('successful:');
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }