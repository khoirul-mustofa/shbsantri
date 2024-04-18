import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/detail_news.controller.dart';

class DetailNewsScreen extends GetView<DetailNewsController> {
  const DetailNewsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailNewsScreen'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailNewsScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
