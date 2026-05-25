import 'package:flutter/material.dart';
import 'package:lucaschatbot/screen/MoodCheckin.dart';

class HomePage extends StatefulWidget{

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Moodcheckin moodcheckin = Moodcheckin();
 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 String healthtips = "";
 
  @override
  Widget build(BuildContext context) {
    final mood = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
    key: _scaffoldKey,
     body: Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

        _moodRecommendations1(mood),
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
  Widget _moodRecommendations1(String mood) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Today's mood: $mood",
        style: TextStyle(
          fontSize: 15,
        ),
        ),
      ],
    );
  }

  Widget _moodRecommendations(BuildContext context, String feeling, String message, String action, String routename) {
    return Container(
              alignment: Alignment.center,
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