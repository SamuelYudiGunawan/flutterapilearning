import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:latihan1/model/provinsimodel.dart';
import 'package:latihan1/shared/customtext.dart';
import 'aboutpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String text = '';
  final String _baseUrl =
      'http://dev.farizdotid.com/api/daerahindonesia/provinsi';
  final List<ProvinsiModel> _list = [];

  Future<void> _fetchThing() async {
    _list.clear();
    final res = await http.get(
      Uri.parse(_baseUrl),
    );
    var response = jsonDecode(res.body);
    for (Map<String, dynamic> map in response['provinsi']) {
      ProvinsiModel provinsiModel =
          ProvinsiModel(id: map['id'], nama: map['nama']);
      _list.add(provinsiModel);
    }
    print('list ${_list.length}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: FutureBuilder(
          future: _fetchThing(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return _buildBody();
                }
            }
          }),
    );
  }

  Widget _buildBody() {
    return Center(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              shrinkWrap: true,
              itemCount: _list.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                ProvinsiModel provinsiModel = _list[index];
                return CustomText(text: provinsiModel.nama);
              }),
          const SizedBox(height: 30),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            CustomText(text: '2 dlroW olleH'),
            SizedBox(
              width: 50,
            ),
            CustomText(text: '1 dlroW olleH'),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  _fetchThing();
                },
                child: const Text('Main Page')),
            const SizedBox(
              width: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                },
                child: const Text('About Page'))
          ]),
        ],
      ),
    ));
  }
}
