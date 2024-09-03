import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)!.settings.arguments as Map;

    print(data);

    String bgImage = data['isDaytime'] ? "day.jpg" : "night.jpg";
    Color bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  dynamic result = await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag'],
                    };
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.edit_location, color: Colors.grey[300]),
                    SizedBox(width: 10),
                    Text('Edit Location'),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    // elevation: 0.0
                    ),
              ),
              // SizedBox(
              //   height: 20.0,
              // ),
              Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 120, 0, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        // '$data.location',
                        data['location'],
                        style: TextStyle(
                            letterSpacing: 2.0,
                            fontSize: 28.0,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        data['time'],
                        style: TextStyle(fontSize: 66.0, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
