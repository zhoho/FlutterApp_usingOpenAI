import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

final dio = Dio();

const openaikey = "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";

var url1 = Uri.parse(
    "https://aipro-86874.web.app/https://openapi.naver.com/v1/papago/n2mt");
var response = http.get(url1);

const apiUrl = 'https://api.openai.com/v1/engines/text-davinci-003/completions';

Future<String> getAnswer(String prompt) async {
  String gptanswer = await getGPTanswer(prompt);
  return gptanswer;
}

Future<String> getGPTanswer(String prompt) async {
  String generatedText = "";

  final response = await http.post(
    Uri.parse(apiUrl),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $openaikey'
    },
    body: jsonEncode({
      //"model": "text-davinci-003",
      'prompt': prompt,
      'max_tokens': 3000,
      'temperature': 0,
      'top_p': 1,
      // 'frequency_penalty': 0,
      // 'presence_penalty': 0
    }),
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(utf8.decode(response.bodyBytes));
    generatedText = data['choices'][0]['text'];
  } else {
    print(response.body);
    generatedText = "Error: ${response.body}";
  }

  return generatedText;
}
