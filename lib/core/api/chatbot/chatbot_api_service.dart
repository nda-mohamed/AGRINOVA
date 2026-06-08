import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://openrouter.ai/api/v1/chat/completions";

  static const String apiKey = "";

  static Future<String> askAI(String prompt) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {
        "Authorization": "Bearer $apiKey",
        "Content-Type": "application/json",
      },
      body: jsonEncode({
        "model": "google/gemma-4-26b-a4b-it:free",
        "messages": [
          {
            "role": "user",
            "content": prompt,
          }
        ]
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      return data["choices"][0]["message"]["content"];
    }

    throw Exception(response.body);
  }
}