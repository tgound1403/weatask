import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utilities/constants.dart';
import 'package:flutter_todo_app/services/weather.dart';
import 'package:intl/intl.dart';
import 'package:flutter_todo_app/widgets/tip_card.dart';

class WeatherWidget extends StatefulWidget {
  @override
  State<WeatherWidget> createState() => _WeatherWidgetState();

  final locationWeather;
  WeatherWidget({this.locationWeather});
}

class _WeatherWidgetState extends State<WeatherWidget> {
  int? conditionNumber;
  int? temperature;
  String? cityName;

  WeatherModel weatherModel = WeatherModel();
  String? message;
  String? weatherIcon;

  String datetimeNow = DateFormat('d/M/y').format(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));


  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void dispose() {
    super.dispose();
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        message = "";
        weatherIcon = "Error";
        cityName = "";
        return;
      } else {
        conditionNumber = weatherData['weather'][0]['id'];
        double temp = weatherData['main']['temp'];
        temperature = temp.toInt();
        cityName = weatherData['name'];
        message = weatherModel.getMessage(temperature);
        weatherIcon = weatherModel.getWeatherIcon(conditionNumber);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextButton(
          onPressed: () async {
            var weatherData = await weatherModel.getLocationWeather();
            updateUI(weatherData);
          },
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: const Icon(
                Icons.list,
                color: Colors.lightBlueAccent,
                size: 30,
              )),
        ),
         const SizedBox(height: 10),
        TipCard(displayText: datetimeNow,),
        const SizedBox(height: 5),
        Card(
           elevation: 10,
           shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)) ),
           child: Container(
             padding: const EdgeInsets.all(20),

             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   children: [
                     const Text(
                       "Bạn đang ở ",
                       textAlign: TextAlign.left,
                       style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.w500
                       ),
                     ),Text(
                       "$cityName",
                       textAlign: TextAlign.left,
                       style: kMessageTextStyle,
                     ),
                   ],
                 ),
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.baseline,
                   textBaseline: TextBaseline.alphabetic,
                   children: <Widget>[
                     const Text(
                         'Nhiệt độ hôm nay là ',
                       style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.w500
                       ),
                     ),
                     Text(
                       '$temperature°',
                       style: kTempTextStyle,
                     ),
                     Text(
                       weatherIcon!,
                       style: kConditionTextStyle,
                     ),
                   ],
                 ),
                 Text(
                   "$message",
                   textAlign: TextAlign.left,
                   style: const TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.w500
                   ),
                 ),
               ],
             ),
           ),
         )
      ],
    );
  }
}
