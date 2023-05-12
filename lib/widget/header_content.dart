import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clima_tag/controller/global_controller.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HeaderContent extends StatefulWidget {
  const HeaderContent({Key? key}) : super(key: key);

  @override
  State<HeaderContent> createState() => _HeaderContentState();
}

class _HeaderContentState extends State<HeaderContent> {
  String city = "";
  String date = DateFormat("yMMMd").format(DateTime.now());
  final globalController = Get.put(GlobalController(), permanent: true);

  @override
  void initState() {
    getCity(globalController.getLat().value, globalController.getLng().value);
    super.initState();
  }

  getCity(lat, lng) async {
    final url =
        Uri.parse('https://api.bigdatacloud.net/data/reverse-geocode-client?'
            'latitude=$lat&'
            'longitude=$lng&'
            'localityLanguage=en');
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    setState(() {
      city = '${data['countryName'].toString()}, ${data['city'].toString()}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          alignment: Alignment.topLeft,
          child: city.length > 2
              ? Text(
                  city,
                  style: const TextStyle(height: 2, fontSize: 30),
                )
              : const Text(
                  'Getting the name...',
                  style: TextStyle(height: 2, fontSize: 20),
                ),
        ),
        Container(
          margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(
            date,
            style: TextStyle(height: 1.5, fontSize: 14, color: Colors.grey),
          ),
        ),
      ],
    );
  }
}
