import 'package:flutter/material.dart';
import '../color_scheme.dart';

  class BreathingScreen extends StatefulWidget{
    const BreathingScreen({super.key});

    @override
    State<BreathingScreen> createState() => _BreathingScreen();
  }

  class _BreathingScreen extends State<BreathingScreen> {
  bool isBreathingIn = true;
  bool isButtonTapped = false;

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
            duration: isBreathingIn ? Duration(seconds: 2) :  Duration(seconds: 4),
            curve: Curves.easeOut,

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
            onPressed: () {
              setState(() {
                 isBreathingIn = !isBreathingIn;
                 isButtonTapped = true;
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF0B1929),
              foregroundColor: const Color(0xFFB5D4F4),
              side: BorderSide(color: Color(0xFF1D3A5C)),
            ),

            child: Text(
                "Start breathing exercise",
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