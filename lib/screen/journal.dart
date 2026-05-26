import 'package:flutter/material.dart';
import '../color_scheme.dart';


class Journal extends StatefulWidget{
  const Journal({super.key});

  @override
  State<Journal> createState() => _Journal();
}

class _Journal extends State<Journal> {

   final TextEditingController messageController =
      TextEditingController();
   final TextEditingController titleController =
      TextEditingController();

  List<Map<String, String>> notes = [];
  
  void saveNote() {
    if(messageController.text.trim().isEmpty) return;
    String titleInput = titleController.text.trim().isEmpty ? "untitled" : titleController.text;
    String userInput = messageController.text;

    setState(() {
      notes.add({
        "title": titleInput,
        "text": userInput,
      });
    });
    messageController.clear();
    titleController.clear();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  SizedBox(height: 20),
                    Text("Journal",
                    style: TextStyle(
                     color: Colors.white,
                     fontSize: 28
                        )
                    ),

                  Text("Your thoughts are safe here",
                  style: TextStyle(
                   color: Color(0xFFB5D4F4),
                       )
                   ),
                ],
              ),
            ),
            
            SizedBox(height: 30,),
            Container(
              color: AppColorScheme.surface,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Column(
                children: [
        
                  TextField(
                    controller: titleController,
                    style: const TextStyle(color: Colors.white),
                    
                    decoration: InputDecoration(
                      fillColor: AppColorScheme.elevated,
                      filled: true,
                      hintText: "Title",
                      hintStyle: TextStyle(color: Colors.white.withValues(alpha: .35)),

                       border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                    
                    ),
        
                  SizedBox(height: 20),
        
                  TextField(
                    controller: messageController,
                    style: const TextStyle(color: Colors.white),
                    maxLines: 10,
        
                    decoration: InputDecoration(
                      fillColor: AppColorScheme.elevated,
                      filled: true,
                      hintText: "Write here",
                      hintStyle: TextStyle(color: Colors.white.withValues(alpha: .35)),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                      ),
                    ),
                    ),
        
                   SizedBox(height: 30,),
                    ElevatedButton(
                      onPressed: saveNote,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColorScheme.accentRim2,
                        padding: const EdgeInsets.all(14),
                      ),
                       child: Text("Save note",
                       style: TextStyle(
                        color: Colors.white,
                       ),
                       ),
                    ),
                
                SizedBox(height: 30,),

                Container(
                  alignment: Alignment.topLeft,
                  child: Text("Recent entries: ",
                  style: TextStyle(
                    color: Color(0xFFB5D4F4)
                  ),
                  ),
                ),
                SizedBox(height: 30,),
            
                    ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: notes.length,
                    itemBuilder: (context, index) {
                      final note = notes[index];
        
                      return Container(
                        margin: EdgeInsets.only(bottom: 12),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColorScheme.elevated,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                 
                            Text(note["title"] ?? "",
                            style: TextStyle(
                             color: Colors.white,
                             fontWeight: FontWeight.w500
                            ),
                            ),
                            Text(note["text"] ?? "",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            ),

                          ],
                        ),
                      );
        
                    }
                  ),
        
                ],
              ),
            ),
        
          ],
        ),
      ),
    );
  }




}