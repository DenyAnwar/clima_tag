import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:clima_tag/controller/global_controller.dart';
import 'package:clima_tag/widget/header_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalController = Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => globalController.checkStatus().isTrue
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SpinKitWaveSpinner(
                      color: Colors.lightBlueAccent,
                      waveColor: Colors.lightBlueAccent,
                      trackColor: Colors.lightBlueAccent,
                      size: 100.0,
                    ),
                  ],
                ),
              )
            : ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  HeaderContent(),
                ],
              )));
  }
}
