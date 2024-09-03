import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    // WorldTime(url: 'Europe/London', location: 'London', flag: 'UK.jpg'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'Greece.webp'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'Egypt.jpg'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'Kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'USA.webp'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'USA.webp'),
    // WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'South Korea.svg'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'Indonesia.webp'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    print(index);
    await instance.getTime(); 
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 22, fontWeight: FontWeight.w800),
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      updateTime(index);
                    },
                    title: Text(locations[index].location),
                    leading: CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/${locations[index].flag}'),
                    ),
                  ),
                ));
          }),
    );
  }
}
