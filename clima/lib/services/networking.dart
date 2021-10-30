import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:clima/services/constants.dart';

class NetworkHelper{
  NetworkHelper({this.lat, this.lon});

  final String? lat, lon;

  Future getData() async{
    var url = Uri.https(
        'api.openweathermap.org',
        '/data/2.5/weather',
        {'lat': lat, 'lon': lon, 'appid': kapiKey, 'units': 'metric'}
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
}
