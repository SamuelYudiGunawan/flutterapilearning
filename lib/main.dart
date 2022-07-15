import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:latihan1/shared/customtext.dart';
import 'package:latihan1/worldtimepages/worldtimeloading.dart';
import 'package:latihan1/worldtimepages/worldtimeloc.dart';
import 'package:latihan1/worldtimepages/worldtimepage.dart';
import 'homepage.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const WorldLoading(),
      '/home': (context) => const WorldHome(),
      '/location': (context) => const ChooseLocation(),
    }
));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String text = "";

  Future<void> _fetchThing() async {
    final res = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
    var response = jsonDecode(res.body);
    text = response['title'];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.green,
        body: Builder(
            builder: (context) => Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      CustomText(text: text),
                      const SizedBox(
                        height: 50,
                        width: 50,
                      ),
                      const CustomText(text: 'Hello World 2'),
                    ]),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CustomText(text: 'Hello World 3'),
                          SizedBox(
                            width: 50,
                          ),
                          CustomText(text: 'Hello World 4'),
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.red,
                              minimumSize: const Size(190, 50)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          },
                          child: const Text('Home Page')),
                      const SizedBox(
                        height: 75,
                        width: 50,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.purple,
                              minimumSize: const Size(190, 50)),
                          onPressed: () {
                            _fetchThing();
                          },
                          child: const Text('About Page')),
                    ]),
                  ],
                ))),
      ),
    );
  }
}
