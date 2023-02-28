import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../constants/constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        title: Text('Home'),
        leading: Icon(
          Icons.menu,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.PRIMARY_COLOR_BDark,
      ),
      //drawer: DrawerWidget(), //Drawer Navigation
      body: Container(
        // height: height * 1,
        // width: width * 1,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: Padding_2,
                  child: Container(
                    child: Row(
                      children: <Widget>[
                        Text(
                          "My Activity",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ], //
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
