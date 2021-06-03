import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Lottie.asset(
            'assets/animations/money_plant.json',
            frameRate: FrameRate.max,
            height: 350,
            width: 350,
          ),
        ],
      ),
    );
  }
}
