import 'package:http/http.dart';
import 'dart:convert';

class worker{
  late String location;

  //Constructor
  worker({required this.location}){
    location=this.location;
  }





  late String temp;
  late String humidity;
  late String air_speed;
  late String description;
  late String main;
  late String icon;

  //method
  Future<void> getData() async{
    try{
      Response response = await get(Uri.parse("http://api.openweathermap.org/data/2.5/weather?q=$location&appid=81afe79e65ad02c69dfc914287618c0f"));
      Map data = jsonDecode(response.body) ;

      //Getting Temp,humidity
      Map temp_data = data['main'];
      String getHumidity= temp_data['humidity'].toString();
      double getTemp = temp_data['temp']-273.15;

      //Getting air speed
      Map wind = data['wind'];
      String getAir_speed= wind['speed'].toString();

      //Getting Description
      List weather_data = data['weather'];
      Map weather_main_data = weather_data[0];
      String getMain_des =weather_main_data['main'];
      String getDesc = weather_main_data['description'];
      String getIcon = weather_main_data['icon'];



      //Assigning values

      temp= getTemp.toString();
      humidity=getHumidity;
      air_speed=getAir_speed;
      description=getDesc;
      main=getMain_des;
      icon=getIcon.toString();


    }catch(e){
      temp= "NA";
      humidity="NA";
      air_speed="NA";
      description="Can't find data";
      main="NA";
      icon="03n";
    }

  }

}

worker instance = worker(location:"Mumbai");
