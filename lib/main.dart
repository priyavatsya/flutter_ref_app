import 'package:flutter/material.dart';
import 'package:flutter_ref_app/dio/home/controller.dart';
import 'package:get_it/get_it.dart';
import 'dio/service_locator.dart';
import 'navigation/bottomNavigation/bottomNavigation.dart';

GetIt getIt= GetIt.instance;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomBar(),
    );
  }
}



