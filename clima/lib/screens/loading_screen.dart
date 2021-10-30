import 'package:flutter/material.dart';

import 'package:clima/screens/location_screen.dart';
import 'package:clima/screens/double_bounce.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude = 0.0;
  double longitude = 0.0;

  @override
  void initState(){
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) => LocationScreen(locationWeather: weatherData,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
