import 'package:clima/services/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Enter the Location you want to search?',
                style: TextStyle(fontSize: 20.0),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kInputFieldDecoration,
                  onChanged: (value){
                    cityName = value;
                  },
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pop(context, cityName);
                },
                child: Text('Click Me'),
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text('Move Back to Home Screen', style: TextStyle(fontSize: 15.0),))
            ],
          ),
        ),
      ),
    );
  }
}
