import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
 final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
 String healthtips = "";
 String moodtext = "";
 String mood = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    key: _scaffoldKey,
     appBar: AppBar(
       backgroundColor: const Color(0xFF4A4460),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.white),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
          ),
          title: null,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
            ),
          ],
      ),

     body: Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [

          Text("How are you feeling today?",
          style: TextStyle(
            fontSize: 28,
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
                  mood = "Happy";
                   moodtext = "You seem happy!";
                });
              },
              child: const Icon(Icons.sentiment_very_satisfied, size: 40),
            ),
             GestureDetector(
              onTap: () {
                 setState(() {
                  mood = "Normal";
                   moodtext = "Why so serious";
                });
              },
              child: const Icon(Icons.sentiment_neutral, size: 40),
            ),
              GestureDetector(
              onTap: () {
                 setState(() {
                   mood = "Unhappy";
                   moodtext = "Had a rough day?";
                });
              },
              child: const Icon(Icons.sentiment_dissatisfied, size: 40),
            ),
              GestureDetector(
              onTap: () {
                 setState(() {
                  mood = "Stressed";
                  moodtext = "You seem to have a bad day.";
                });
              },
              child: const Icon(Icons.mood_bad, size: 40),
            ),
          ],
        ),

      const SizedBox(height: 30),

        Text(
          moodtext,
          style: const TextStyle(fontSize: 18),
        ),

       const SizedBox(height: 30),

        GestureDetector(
          onTap: () {
            setState(() {
              healthtips = "this is a placeholder for your damn tip";
            });
          },
          child: Text("Daily health tips",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),

         const SizedBox(height: 30),

         Text(
          healthtips,
          style: TextStyle(
            fontSize: 18
          ),
         )


        ],
      ),
      )

    );
  }
}