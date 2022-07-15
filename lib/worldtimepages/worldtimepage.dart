import 'package:flutter/material.dart';

class WorldHome extends StatefulWidget {
  const WorldHome({Key? key}) : super(key: key);

  @override
  State<WorldHome> createState() => _WorldHomeState();
}

class _WorldHomeState extends State<WorldHome> {
  late Map data = {};

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    data =
        data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map : data;
    print(data);

    String bgImage = data['isDaytime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'date': result['date'],
                      'location': result['location'],
                      'isDaytime': result['isDaytime'],
                      'flag': result['flag']
                    };
                  });
                },
                icon: const Icon(
                  Icons.airplanemode_active,
                  color: Colors.black,
                ),
                label: Text(
                  'Change Location',
                  style: TextStyle(
                      color: Colors.grey[300],
                    fontSize: 24.0,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 3),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/' + data['flag']),
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Text(
                    data['location'],
                    style: const TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Text(data['date'],
                  style: const TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                  )),
              const SizedBox(height: 5.0),
              Text(data['time'],
                  style: const TextStyle(
                    fontSize: 66.0,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
