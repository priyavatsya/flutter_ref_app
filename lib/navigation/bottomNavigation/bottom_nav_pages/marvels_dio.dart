import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  const HeroPage({Key? key}) : super(key: key);

  @override
  State<HeroPage> createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  var jsonList;

  @override
  void initState(){
    super.initState();
    getData();
  }

  void getData() async{
    try{
      var response= await Dio().get('https://protocoderspoint.com/jsondata/superheros.json');
      if(response.statusCode == 200){
        setState(() {
          jsonList= response.data['superheros'] as List;
        });
      }
     // print(response);
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context,int index){
          return Card(
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.network(jsonList[index]['url'],
              fit: BoxFit.fill,
              width: 60,
              height: 60,),
            ),
          title: Text(jsonList[index]['name']),
          subtitle: Text(jsonList[index]['power']),
          )
          );
      },
      itemCount: jsonList== null ? 0: jsonList.length ,

      )
    );
  }
}
