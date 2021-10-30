import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  // const LocationScreen({Key? key}) : super(key: key);
  LocationScreen({this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  double? temperature;
  String? cityName;
  // int? condition;
  String? iconCode;

  @override
  void initState() {
    super.initState();

    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData){
    setState(() {
      if (weatherData == null){
        temperature = 0.0;
        cityName = 'Not defined buddy';
        iconCode = 'unable to fetch';
        return;
      }
      temperature = weatherData['main']['temp'];
      // condition = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      iconCode = weatherData['weather'][0]['icon'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
              Text(
                '$temperature°',
                style: TextStyle(fontSize: 50.0, color: Colors.green),
              ),
              Image.network('http://openweathermap.org/img/wn/$iconCode@2x.png',),
              Text(
                '$cityName',
                style: TextStyle(fontSize: 50.0, color: Colors.green),
              ),
              ElevatedButton(
                onPressed: ()async{
                  var weatherData = await WeatherModel().getLocationWeather();
                  updateUI(weatherData);
                },
                  child: Text('Get Current Location')
                ),
                ElevatedButton(
                  onPressed: () async{
                    var typedName = await Navigator.push(context, MaterialPageRoute(builder: (context) => CityScreen()));
                    if(typedName != null){
                      var getData = await WeatherModel().getCityWeather(typedName);
                      updateUI(getData);
                    }
                    },
                    child: Text('City Screen'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
