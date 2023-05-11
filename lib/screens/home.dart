import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clima_tag/controller/global_controller.dart';
import 'package:clima_tag/widget/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final globalController = Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
