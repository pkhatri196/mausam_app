import 'package:flutter/material.dart';
import 'package:mausam_app/Worker/worker.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  late String city="Indore";
late String temp;
late String hum;
late String air_speed;
late String des;
late String main;
late String icon;

  void startApp(String city) async{
    worker instance = worker(location:city);
    await instance.getData();

  temp=instance.temp;
  hum=instance.humidity;
  air_speed=instance.air_speed;
  des=instance.description;
  main=instance.main;
  icon=instance.icon;


    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home',arguments:{
        "temp_value" : temp,
        "hum_value": hum,
        "air_speed_value": air_speed,
        "des_value" : des,
        "main_value":main,
        "icon_value":icon,
        "city_value":city,

      }
      );
    });



  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  Widget build(BuildContext context) {
    Map search =ModalRoute.of(context)?.settings.arguments as Map;


    if(search?.isNotEmpty ?? false){
      city=search['searchText'];
    }
    startApp(city);

    return Scaffold(
      backgroundColor: Color(0xff366d7a),
      body:
      Center(
        child:Padding(
          padding: const EdgeInsets.only(top:250.0,),
          child: Column(
            children: [
              Lottie.asset('assets/weathericon.json',height: 150,width:200),
              Text("Mausam App",style:TextStyle(fontFamily: "ZenKurenaido",color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Made by Payal",style:TextStyle(fontFamily: "ZenKurenaido",color:Colors.white,fontSize:20)),
              SizedBox(height: 10),
              SpinKitThreeBounce(
            color: Colors.white,
            size: 20.0,
          ),

            ],
          ),
        )
      )
    );
  }
}
