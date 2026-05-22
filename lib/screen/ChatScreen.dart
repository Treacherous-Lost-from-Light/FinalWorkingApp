


//FIRST PROTOTYPE WITHOUT THE UI DESIGN
//WON'T GONNA BE USED ANYMORE

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Locas chatbot',
      theme: ThemeData.dark(),
      home: const ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController =
      TextEditingController();
  //List where the messages are saved. It has string for texts and dyanamic for isUser: true/false
  // isUser lets the compiler knows where the chat bubble will be displayed later.
  List<Map<String, dynamic>> messages = [];

//Method/Function for sendMessage
  Future<void> sendMessage() async{

    //If empty yung user input, return
    if (messageController.text.trim().isEmpty) return;
    String userInput = messageController.text;

    
    setState(() {
      messages.add({
        "text": userInput,
        "isUser": true,
      });
    });
    messageController.clear();

    //Responsible for the AI replies.
      String aiReply = await getResponse(userInput);
      setState(() {
        messages.add({
          "text": aiReply,
          "isUser": false,
      });
      });
    
    }
  //This is the function responsible for the AI. 
  //It connects the app into the internet and transfers the user message and AI msg back and forth
  //Ai used: Groq
  //Note: Possible to seperate to another file. Probably more efficient if possible
  Future<String> getResponse(String message) async {
  const apiKey = "";
 
  final url = Uri.parse("https://api.groq.com/openai/v1/chat/completions");

  final response = await http.post(
    url,
    headers: {
      "Authorization": "Bearer $apiKey",
      "Content-Type": "application/json",
    },
    body: jsonEncode({
      "model": "llama-3.1-8b-instant",
      "messages": [
        {
          "role": "system",
          "content":
              "You are a helpful health assistant. Give short, simple, supportive wellness advice only."
        },
        {
          "role": "user",
          "content": message
        }
      ],
      "temperature": 0.7
    }),
  );
        print(response.statusCode);
        print(response.body);
        final data = jsonDecode(response.body);

//Safe fallback if the AI response errors
if (data["choices"] == null) {
  return "AI error: ${data["error"]?["message"] ?? "Unknown error"}";
}

return data["choices"][0]["message"]["content"];
}

  //This is where the UI happens
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Locas"),
      ),

      //THE HAMBURGER
       drawer: Drawer(
        child: ListView(
          children: [
             const DrawerHeader(
              decoration: BoxDecoration(
              color: Colors.grey,
             ),

            child: Text(
             "Menu",
             style: TextStyle(
             fontSize: 24,
              ),
            ),
       ),

       ListTile(
          leading: const Icon(Icons.home),
          title: const Text("Chatbot"),
          onTap: () {
            Navigator.pop(context);
          },
        ),

        ListTile(
          leading: const Icon(Icons.favorite),
          title: const Text("Mood Tracker"),
          onTap: () {
            Navigator.pop(context);
          },
        ),

        ListTile(
          leading: const Icon(Icons.water_drop),
          title: const Text("Water Tracker"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    ),
  ),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,

 //This is the function responsible for the alighment of chatbubble
              itemBuilder: (context, index) {
                bool isUser = messages[index]["isUser"];
                return Align(
                  alignment: 

                      //If isUser true/false: Align it in right/left
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(

                        //If isUser true/false: Color blue/grey
                       color: isUser ? Colors.blue : Colors.grey[800],
                       borderRadius: BorderRadius.circular(12),
                        ),
                     child: Text(
                       messages[index]["text"],
                       style: const TextStyle(fontSize: 16),
                       ),
                ),
               );
             },
            ),
          ),
          //Message bar or something
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "Ask something...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: sendMessage,
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}