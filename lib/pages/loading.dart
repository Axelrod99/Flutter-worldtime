import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'dart:convert';
// import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String time = 'loading...';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Berlin", flag: "germany.png", url: 'Europe/Berlin');
    await instance.getTime();
    // print({instance.time});
    // setState(() {
    //   time = instance.time;
    // });
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime' : instance.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
    // getTime();
  }

  //   void getTime() async {
  //   Response response = await get(
  //       Uri.parse('http://worldtimeapi.org/api/timezone/Europe/London'));
  //   Map data = jsonDecode(response.body);
  //   // print(data);

  //   String datetime = data['datetime'];
  //   String offset = data['utc_offset'].substring(1,3);

  //   // print(datetime);
  //   // print(offset);

  //   DateTime now = DateTime.parse(datetime);
  //   now.add(Duration(hours: int.parse(offset)));
  //   print(now);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //     body: Padding(
      //   padding: EdgeInsets.all(50.0),
      //   // child: Text(time),
      //   // child: Text('loading'),
      // ),
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitFoldingCube(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
