import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/constants.dart';

class WeatherModel{
  Future<dynamic> getCityWeather(String? cityName) async{
    var url =   Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {'q': cityName, 'appid': kapiKey, 'units': 'metric'}
    );

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print('Request failed with status: ${response.statusCode}.');
      return {};
    }
  }

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(lat: '${location.latitude}', lon: '${location.longitude}');
    var weatherData = await networkHelper.getData();

    return weatherData;
  }
}