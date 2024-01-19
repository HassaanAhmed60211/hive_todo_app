import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BackgroundWid extends StatelessWidget {
  Widget child;


  BackgroundWid({super.key, required this.child,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.19, -0.98),
            end: Alignment(0.19, 0.98),
            colors: [Color(0xFF2A2A2E), Color(0xFF2A125A), Colors.black],
          ),
        ),
        child: child,
      ),
    );
  }
}
