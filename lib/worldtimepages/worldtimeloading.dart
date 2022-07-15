
import 'package:flutter/material.dart';
import '../model/worldtimemodel.dart';

class WorldLoading extends StatefulWidget {
  const WorldLoading({Key? key}) : super(key: key);

  @override
  State<WorldLoading> createState() => _WorldLoadingState();
}

class _WorldLoadingState extends State<WorldLoading> {

  String time = 'loading';

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: 'Jakarta', flag: 'indonesia.png', url: 'Asia/Jakarta');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'date': instance.date,
      'isDaytime' : instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        body: const Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}
