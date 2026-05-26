import 'package:flutter/material.dart';
import '../color_scheme.dart';
import 'dart:async';

  class BreathingScreen extends StatefulWidget{
    const BreathingScreen({super.key});

    @override
    State<BreathingScreen> createState() => _BreathingScreen();
  }

  class _BreathingScreen extends State<BreathingScreen> {
  
  bool isButtonTapped = false;
  bool isBreathingIn = true;

  Timer? breathingTimer;
  int secondsPassed = 0;

  void startBreathing() {
  setState(() {
    isButtonTapped = true;
    isBreathingIn = false; 
    secondsPassed = 0;
  });

  breathingTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
    setState(() {
      secondsPassed += 3;

      if (secondsPassed >= 30) {
        timer.cancel();
        isButtonTapped = false;
        isBreathingIn = true; 
      } else {
        isBreathingIn = !isBreathingIn;
      }
    });
  });
}

void stopBreathing() {
  breathingTimer?.cancel();

  setState(() {
    isButtonTapped = false;
    isBreathingIn = true;
    secondsPassed = 0;
  });
}

  @override
  void dispose() {
    breathingTimer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorScheme.bg,
      appBar: AppBar(
        backgroundColor: AppColorScheme.surface,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Color(0xFFB5D4F4),
        ),

      ),

      body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Breathing Exercise",
            style: TextStyle(
              color: Color(0xFFB5D4F4),
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
            Text(isButtonTapped ? isBreathingIn ? "Exhale..." : "Inhale..." : "",
            style: TextStyle(
              color: Color(0xFFB5D4F4),
              fontSize: 15
            ),
          ),
      
         
          SizedBox(height: 30),

          AnimatedScale(
            scale: isBreathingIn ? 1.0 : 1.5, 
            duration: const Duration(seconds: 3),
            curve: Curves.easeInOut,

             child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
              color: isBreathingIn ? Color(0xFF185FA5) : Color(0xFF85B7EB),
              shape: BoxShape.circle,

              boxShadow: [
                BoxShadow(
                  color: Color(0xFF1D3A5C),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
             ),
          ),

          SizedBox(height: 40),
          ElevatedButton(
            onPressed: isButtonTapped ? stopBreathing : startBreathing,
  
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0B1929),
              foregroundColor: const Color(0xFFB5D4F4),
              side: BorderSide(color: Color(0xFF1D3A5C)),
            ),

            child: Text(
                isButtonTapped ? "Stop" : "Start breathing exercise",
              style: TextStyle(
                color: Color(0xFFB5D4F4),
              ),
            ),
            ),

          SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: AppColorScheme.elevated,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: AppColorScheme.border,
                  blurRadius: 5,
                  offset: const Offset(0, 5),
                ),
              ],
            ),

            child: const Text(
              "This exercise should help you calm down.\nTry relaxing for a bit, do this exercise for at least a minute.",
              style: TextStyle(
                color: Color(0xFFB5D4F4),
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
        ],
        ),
      ),
    );
   }
  }