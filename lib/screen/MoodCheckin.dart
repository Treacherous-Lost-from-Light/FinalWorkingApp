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
      body: Padding(padding: EdgeInsets.all(40),
      child: Column(
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
            fontSize: 25,
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
              child: const Icon(Icons.sentiment_very_satisfied, size: 40),
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
              child: const Icon(Icons.sentiment_neutral, size: 40),
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
              child: const Icon(Icons.sentiment_dissatisfied, size: 40),
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
              child: const Icon(Icons.mood_bad, size: 40),
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

          Text(moodtext,
          style: TextStyle(
          fontSize: 15,
          ),
          ),
          const SizedBox(height: 20),
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

        Text(moodReflection,
        style: TextStyle(
          fontSize: 15,
        ),
        ),

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