import 'package:flutter/material.dart';

class BreathingScreen extends StatefulWidget{
  const BreathingScreen({super.key});

  @override
  State<BreathingScreen> createState() => _BreathingScreen();
}

class _BreathingScreen extends State<BreathingScreen> {
bool isBreathingIn = true;

@override
Widget build(BuildContext context) {
  return Scaffold(

    appBar: AppBar(
        backgroundColor: const Color(0xFF4A4460),
        elevation: 0,
    ),

    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Breathing Exercise"),
        SizedBox(height: 40),
        Text(isBreathingIn ? "Inhale..." : "Exhale..."),
        SizedBox(height: 20),
        AnimatedContainer(
          duration: Duration(seconds: isBreathingIn ? 5 : 3),
          width: isBreathingIn ? 220 : 120,
          height: isBreathingIn ? 220 : 120,
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isBreathingIn ? Colors.green : Colors.greenAccent,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
               isBreathingIn = !isBreathingIn;
            });
          }, 
          child: Text("Start breathing"),
          )
      ],
    ),

  );
 }
}