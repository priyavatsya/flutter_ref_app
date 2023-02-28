// import 'package:flutter/material.dart';
// import '../../../dio/data/model/user_model.dart';
// import '../../../dio/home/controller.dart';
// import '../../../dio/home/widgets/add_user_btn.dart';
// import '../../../dio/home/widgets/app_bar.dart';
// import '../../../dio/service_locator.dart';
//
// class FavPage extends StatelessWidget {
//   FavPage({Key? key}) : super(key: key);
//   final homeController = getIt<HomeController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: const BaseAppBar(),
//       floatingActionButton: AddUserBtn(),
//       body: FutureBuilder<List<UserModel>>(
//         future: homeController.getUsers(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             final error = snapshot.error;
//             return Center(
//               child: Text(
//                 "Error: " + error.toString(),
//               ),
//             );
//           } else if (snapshot.hasData) {
//             if (snapshot.data!.isEmpty) {
//               return const Center(
//                 child: Text('No data'),
//               );
//             }
//             return ListView.builder(
//               itemCount: snapshot.data?.length,
//               itemBuilder: (context, index) {
//                 final user = snapshot.data![index];
//                 return ListTile(
//                   leading: user.avatar != null
//                       ? ClipRRect(
//                     borderRadius: BorderRadius.circular(50),
//                     child: Image.network(
//                       user.avatar!,
//                       width: 50,
//                       height: 50,
//                     ),
//                   )
//                       : null,
//                   title: Text(user.email ?? ''),
//                   subtitle: Text(user.firstName ?? ''),
//                 );
//               },
//             );
//           }
//           return Container();
//         },
//       ),
//     );
//   }
// }