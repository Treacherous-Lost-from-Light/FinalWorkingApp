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
     body: Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

         Text("Today's mood: $mood",
        style: TextStyle(
          fontSize: 15,
        ),
        ),

        SizedBox(height: 30,),
        
        if(mood == "Happy") ...[
          _moodRecommendationCard(
            context, 
            "Enjoying life are we?", 
            "Maintain you mood", 
            "Begin writing", 
            '/Breathing')
        ]
        else if(mood == "Normal") ...[
          _moodRecommendationCard(
            context, 
            "Enjoying life are we?", 
            "Maintain you mood", 
            "Begin writing", 
            '/Breathing')
        ]
        else if(mood == "Unhappy") ...[
          _moodRecommendationCard(
            context, 
            "Enjoying life are we?", 
            "Maintain you mood", 
            "Begin writing", 
            '/Breathing')
        ]
        else if(mood == "Stressed") ...[
          _moodRecommendationCard(
            context, 
            "Enjoying life are we?", 
            "Maintain you mood", 
            "Begin writing", 
            '/Breathing')
        ],


        
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
            fontSize: 13,
          ),
         )


        ],
      ),
      )

    );
  }

  Widget _moodRecommendationCard(BuildContext context, String feeling, String message, String action, String routename) {
    return Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.amber,
              ),
        
              //TEXT
              child: Column(
                children: [
                  Text(feeling,
                  style: TextStyle(
                    color: Colors.black,
                   ),
                  ),
                  Text(message,
                  style: TextStyle(
                    color: Colors.black,
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