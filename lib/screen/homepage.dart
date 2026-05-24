import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 bool moodSelected = false;
 String healthtips = "";
 String moodtext = "";
 String mood = "";
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    key: _scaffoldKey,
     body: Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
           Text("Daily check in",
          style: TextStyle(
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
                  
                  if(mood == "Happy") {
                    moodSelected = false;
                    mood = "";
                  }
                  else{
                    moodSelected = true;
                    mood = "Happy";
                    moodtext = "You seem happy today!";
                  }
                });
              },
              child: const Icon(Icons.sentiment_very_satisfied, size: 40),
            ),

             GestureDetector(
              onTap: () {
                 setState(() {

                  if(mood == "Normal") {
                    moodSelected = false;
                    mood = "";
                  }
                  else{
                    moodSelected = true;
                    mood = "Normal";
                    moodtext = "Why so serious";
                  }
                  
                });
              },
              child: const Icon(Icons.sentiment_neutral, size: 40),
            ),

              GestureDetector(
              onTap: () {
                 setState(() {

                  if(mood == "Unhappy") {
                    moodSelected = false;
                    mood = "";
                  }
                  else{
                    moodSelected = true;
                    mood = "Unhappy";
                    moodtext = "You seem to have a bad day";
                  }

                });
              },
              child: const Icon(Icons.sentiment_dissatisfied, size: 40),
            ),

              GestureDetector(
              onTap: () {
                 setState(() {

                 if(mood == "Stressed") {
                    moodSelected = false;
                    mood = "";
                  }
                  else{
                    moodSelected = true;
                    mood = "Stressed";
                    moodtext = "Are you okay?";
                  }

                });
              },
              child: const Icon(Icons.mood_bad, size: 40),
            ),
          ],
        ),

        _MoodSelected(),


       const SizedBox(height: 30),
        GestureDetector(
          onTap: () {
            setState(() {
              if(healthtips == "") {
                healthtips = "tip";
              }
              else {healthtips = ""; }
            });
          },
          child: Text("Daily health tips",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),

         const SizedBox(height: 30),

         Text(
          healthtips,
          style: TextStyle(
            fontSize: 15,
          ),
         )


        ],
      ),
      )

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
          Text("Recommendation: ",
          style: TextStyle(fontSize: 25),
          ),
          
          const SizedBox(height: 20),
           if(mood == "Happy") ...[
             Text("What would you like to do for today?",
             style: TextStyle(fontSize: 16),)
           ]
           else if(mood == "Normal") ...[

           ]
           else if(mood == "Unhappy") ...[
            
           ]
           else if(mood == "Stressed") ...[
            
           ]

          ],
      );
    }
    return const SizedBox.shrink();
  }

}