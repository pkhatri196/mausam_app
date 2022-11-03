import 'dart:convert';
import 'dart:math';
import 'package:mausam_app/Activities/loading.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
// import 'package:flutter_weather_icons/flutter_weather_icons.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController= new TextEditingController();
  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }

  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)?.settings.arguments as Map;
    String temp = ((info['temp_value']).toString());
    String air =((info['air_speed_value']).toString());
    String icon = info['icon_value'];
    String getcity = info['city_value'];
    String hum = info['hum_value'];
    String desc =info['des_value'];
    if(temp=="NA"){
      print("NA");
    }
    else{
      String temp = ((info['temp_value']).toString()).substring(0,4);
      String air =((info['air_speed_value']).toString()).substring(0,4);
    }


    var city_name = ['Mumbai', 'Delhi', 'Chennai', 'Ghaziabad', 'Srinagar'];
    final _random = new Random();
    var city = city_name[_random.nextInt(city_name.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false ,
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(0),
        child:AppBar(
          backgroundColor: Color(0xffb4c7d4),
        )
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.1,
                    0.6,
                  ],
                  colors: [
                    Color(0xffb4c7d4),
                    Color(0xff366d7a),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Container(
                    //Search Container
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    margin: EdgeInsets.symmetric(horizontal: 14, vertical: 20),
                    decoration: BoxDecoration(
                      color: Color(0xffb4c7d4),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            if((searchController.text).replaceAll(" ","")==""){
                              print("Blank Search");
                            }
                            else{
                              Navigator.pushReplacementNamed(context, "/loading",arguments:{
                                "searchText":searchController.text
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(2, 0, 7, 0),
                            child: Icon(
                              Icons.search,
                              color:Color(0xff366d7a),
                            ),
                          ),
                        ),
                        Expanded(
                            child: TextField(
                              controller:searchController,
                                decoration: InputDecoration(
                          hintText: "Search $city",
                          border: InputBorder.none,
                        )))
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffb4c7d4).withOpacity(0.5),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          padding: EdgeInsets.all(26),
                          child: Row(
                            children: [
                              Image.network("http://openweathermap.org/img/wn/$icon@2x.png"),
                              SizedBox(width:10),
                              Column(
                          children: [
                              Text("$desc",
                                style:TextStyle(fontSize:20,fontWeight: FontWeight.bold,
                              ),),
                              Text("In $getcity",style:TextStyle(fontSize:20,fontWeight: FontWeight.bold,),),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height:210,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffb4c7d4).withOpacity(0.5),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 20,vertical:25),
                          padding: EdgeInsets.all(35),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:[
                              Icon(Icons.thermostat,size:40,color:Color(0xff366d7a)),
                              Row(

                                mainAxisAlignment: MainAxisAlignment.center,
                                children:[
                                  Text("$temp",style:TextStyle(fontSize: 70,fontWeight: FontWeight.bold)),
                                  SizedBox(width:10),
                                  Text("C",style:TextStyle(fontSize: 40,)),
                                  ]
                              )
                            ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Expanded(
                        child: Container(
                          height:170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffb4c7d4).withOpacity(0.5),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.all(35),
                          child: Column(
                            children:[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.wind_power,size:25,color:Color(0xff366d7a))
                                ],
                              ),
                              SizedBox(height:10),
                              Text("$air",style:TextStyle(fontSize: 37,fontWeight: FontWeight.bold,)),
                              Text("m/sec",style:TextStyle(fontSize: 16,)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height:170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffb4c7d4).withOpacity(0.5),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          padding: EdgeInsets.all(35),
                          child:  Column(
                            children:[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.water_drop,size:25,color:Color(0xff366d7a))
                                ],
                              ),
                              SizedBox(height:10),
                              Text("$hum",style:TextStyle(fontSize: 37,fontWeight: FontWeight.bold,)),
                              Text("Percent",style:TextStyle(fontSize: 16,)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height:70),
                  Container(
                    padding:EdgeInsets.all(10),
                    child:Column(
                      children: [
                        Text("Made by Payal",style:TextStyle(color:Color(0xffb4c7d4))),
                        Text("Data Provided by OpenWeatherMap",style:TextStyle(color:Color(0xffb4c7d4),),),
                      ],

              ),),
          ],
        ),
    ),),
      ),);
  }
}
