import 'package:flutter/material.dart';
import 'package:latihan1/homepage.dart';
import 'package:latihan1/shared/customtext.dart';

import 'main.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            CustomText(text: '1'),
            SizedBox(
              height: 100,
              width: 50,
            ),
            CustomText(text: '2'),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            CustomText(text: '3'),
            SizedBox(
              width: 50,
            ),
            CustomText(text: '4'),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                child: const Text('Home Page')),
            const SizedBox(
              width: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                },
                child: const Text('Main Page'))
          ]),
        ],
      )),
    );
  }
}
