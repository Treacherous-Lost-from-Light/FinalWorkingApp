import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AIService{

 Future<String> getResponse(String message) async {
  
 final String? apiKey = dotenv.env['GROQ_API_KEY'];
    if (apiKey == null || apiKey!.isEmpty) {
      return "API key missing";
    }
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

}