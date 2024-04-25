import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingApp extends StatelessWidget {
  const LoadingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        height: 150,
        child: Lottie.asset('assets/lottie/lottie_loading.json'),
      ),
    );
  }
}
