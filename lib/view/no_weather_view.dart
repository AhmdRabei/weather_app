import 'package:flutter/material.dart';

class NoWeatherView extends StatelessWidget {
  const NoWeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'There is no weather 🙄 start',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'searching now 🔎',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
