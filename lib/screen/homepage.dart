import 'package:flutter/material.dart';
import 'package:lucaschatbot/screen/MoodCheckin.dart';

class HomePage extends StatefulWidget{

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
 Moodcheckin moodcheckin = Moodcheckin();
 String healthtips = "";
 
  @override
  Widget build(BuildContext context) {
    final mood = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
    backgroundColor: Color(0xFF060F1A),
    
     body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
         Container(
           alignment: Alignment.topLeft,
           child: Text("Today's mood: $mood",
                   style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 129, 152, 175)
                   ),
                   ),
         ),

        SizedBox(height: 100,),
        
        if(mood == "Happy") ...[
          _moodRecommendationCard(
            context, 
            "You're happy today, I'm proud of you", 
            "Writing helps you to maintain mood.", 
            "Begin writing", 
            '/Chatbot')
        ]
        else if(mood == "Normal") ...[
          _moodRecommendationCard(
            context, 
            "So a normal day is it?", 
            "Sometimes we forget to notice the small things that truly matters. Writing down a moment or feeling that lingered for a bit than it should have helps you notice those small things.", 
            "Begin exercise", 
            '/Breathing')
        ]
        else if(mood == "Unhappy") ...[
          _moodRecommendationCard(
            context, 
            "You seem sad today", 
            "Writing down what bothers you helps lighten your mood. Talking about it also helps.", 
            "Talk with Lucas", 
            '/Chatbot')
        ]
        else if(mood == "Stressed") ...[
          _moodRecommendationCard(
            context, 
            "You seemed overwhelmed today.?", 
            "Take a short pause and breathe. Small moment of calm can help reset you mind.", 
            "Begin Exercise", 
            '/Breathing')
        ],

        SizedBox(height: 20),

        
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
            fontSize: 15,
            color: Colors.white,
          ),
          ),
        ),

         Text(
          healthtips,
          style: TextStyle(
             fontSize: 10,
             color: Colors.white,
          ),
         )


        ],
      ),
      )

    );
  }

  Widget _moodRecommendationCard(BuildContext context, String feeling, String message, String action, String routename) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
        color: Color(0xFF103A5C), 
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFF103A5C)),
      ),
        
              //TEXT
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [


                  Text(feeling,
                  style: TextStyle(
                    color: Colors.white,
                   ),
                  ),
                  
                  SizedBox(height: 15),

                  Text(message,
                  style: TextStyle(
                    color: Colors.white,
                   ),
                 ),

                 SizedBox(height: 10,),

                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, routename);
                    },
                     child: Text(action,
                     style: TextStyle(
                      color: Colors.black,
                     ),
                     ),
                    )
                  
                ],
            )
     );
           
      
  }

}