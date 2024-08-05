import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final String apiKey = '9cc1bec200044ec50e59b7a7f2486769';
  String city = 'Toronto';
  var temperature;
  var description;
  var humidity;
  var windSpeed;

  Future<void> fetchWeather() async {
    final response = await http.get(
      Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey&units=metric',
      ),
    );

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      setState(() {
        temperature = result['main']['temp'];
        description = result['weather'][0]['description'];
        humidity = result['main']['humidity'];
        windSpeed = result['wind']['speed'];
      });
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter city name',
              ),
              onSubmitted: (value) {
                setState(() {
                  city = value;
                  fetchWeather();
                });
              },
            ),
            SizedBox(height: 20),
            temperature != null
                ? Column(
                    children: <Widget>[
                      Text(
                        'Temperature: $temperature°C',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'Description: $description',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'Humidity: $humidity%',
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        'Wind Speed: $windSpeed m/s',
                        style: TextStyle(fontSize: 24),
                      ),
                    ],
                  )
                : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
