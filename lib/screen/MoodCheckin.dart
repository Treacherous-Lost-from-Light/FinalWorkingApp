import 'package:flutter/material.dart';

class Moodcheckin extends StatefulWidget{
  const Moodcheckin({super.key});

  @override
  State<Moodcheckin> createState() => _Moodcheckin();
}

class _Moodcheckin extends State<Moodcheckin> {
  String currentMood = "";
  bool moodSelected = false;
  String healthtips = "";
  String moodtext = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          

          Text("Daily Check in",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          ),

          const SizedBox(height: 30),

          Text("How are you feeling today?",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
          ),

          const SizedBox(height: 30),

         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [

            GestureDetector(
              onTap: () {
                setState(() {
                  if(currentMood == "Happy") {
                     moodSelected = false;
                     currentMood = "";
                  }
                  else{
                    moodSelected = true;
                    currentMood = "Happy";
                    moodtext = "You seem happy today!";
                  }
                });
              },
              child: AnimatedScale(
                scale: currentMood == "Happy" ? 1.4 : 1.0, 
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Icon(
                  Icons.sentiment_very_satisfied, 
                  size: 40,
                  color: currentMood == "Happy" ? Color(0xFFFDD835) : Colors.grey),
                )
            ),

             GestureDetector(
              onTap: () {
                 setState(() {

                  if(currentMood == "Normal") {
                    moodSelected = false;
                    currentMood = "";
                  }
                  else{
                    moodSelected = true;
                    currentMood = "Normal";
                    moodtext = "Why so serious";
                  }
                  
                });
              },
              child: AnimatedScale(
                scale: currentMood == "Normal" ? 1.4 : 1.0, 
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Icon(Icons.sentiment_neutral, 
                size: 40,
                 color: currentMood == "Normal" ? Color(0xFF90A4AE) : Colors.grey),
                ),
            ),

              GestureDetector(
              onTap: () {
                 setState(() {

                  if(currentMood == "Unhappy") {
                    moodSelected = false;
                   currentMood = "";
                  }
                  else{
                    moodSelected = true;
                    currentMood = "Unhappy";
                    moodtext = "You seem to have a bad day";
                  }

                });
              },
               child: AnimatedScale(
                scale: currentMood == "Unhappy" ? 1.4 : 1.0, 
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Icon(Icons.sentiment_dissatisfied, 
                size: 40,
                 color: currentMood == "Unhappy" ? Color(0xFFFF8A65) : Colors.grey),
                )
            ),

              GestureDetector(
              onTap: () {
                 setState(() {

                 if(currentMood== "Stressed") {
                    moodSelected = false;
                    currentMood= "";
                  }
                  else{
                    moodSelected = true;
                    currentMood = "Stressed";
                    moodtext = "Are you okay?";
                  }

                });
              },
               child: AnimatedScale(
                scale: currentMood == "Stressed" ? 1.4 : 1.0, 
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,
                child: Icon(Icons.mood_bad, 
                size: 40,
                 color: currentMood == "Stressed" ? Color(0xFFE57373) : Colors.grey),
                )
            ),
          ],
        ),

        _MoodSelected(),

        ],
      ),
      ),
    );

  } 
   Widget _MoodSelected() {
    if(moodSelected) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
          children: [

          const SizedBox(height: 30),
           if(currentMood == "Happy") ...[
            _mooodswings(context,
             "You're happy", 
             "Maintain your mood", 
             )
           ]
           else if(currentMood == "Normal") ...[
             _mooodswings(context,
             "You're normal", 
             "Maintain your mood", 
             )    
           ]
           else if(currentMood == "Unhappy") ...[
              _mooodswings(context,
             "You're unhappy", 
             "Maintain your mood", 
             )    
           ]
           else if(currentMood == "Stressed") ...[
             _mooodswings(context,
             "You're stressed", 
             "Maintain your mood", 
             )
           ]

          ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget _mooodswings(BuildContext context, String moodDetails, String moodReflection) {
    return Column(
      children: [
        Text(moodDetails,
        style: TextStyle(
          fontSize: 15,
        ),
        ),

        SizedBox(height: 10),

        Text(moodReflection,
        style: TextStyle(
          fontSize: 15,
        ),
        ),

        SizedBox(height: 30),

        ElevatedButton(
          onPressed: () {
             Navigator.pushNamed(
              context, 
              '/',
              arguments: currentMood
              );
          }, 
          child: Text(
            "Continue",
            style: TextStyle(
              fontSize: 15
            ),
            ),
          )
      ],
    );

  }
}