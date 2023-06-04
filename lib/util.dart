import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:dio/dio.dart';

final dio = Dio();

final openaikey = dotenv.env['openaiapiKey'];
const apiUrl = 'https://api.openai.com/v1/engines/text-davinci-003/completions';

Future<String> getAnswer(String prompt) async {
  String translatedPrompt = await getTranslation_papago(prompt, 1);
  String gptAnswer = await getGPTanswer(translatedPrompt);
  String translatedGPTAnswer = await getTranslation_papago(gptAnswer, 2);
  return translatedGPTAnswer;
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
      'max_tokens': 5000,
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

Future<String> getTranslation_papago(String prompt, int option) async {
  String clientId = "XmTlLucY96Uw2pp4rj8q";
  String clientSecret = "9r2hYCiRF5";
  String contentType = "application/x-www-form-urlencoded; charset=UTF-8";
  String url = "https://openapi.naver.com/v1/papago/n2mt";

  http.Response trans = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': contentType,
      'X-Naver-Client-Id': clientId,
      'X-Naver-Client-Secret': clientSecret,
      'Access-Control-Allow-Origin': '*', // CORS 허용
    },
    body: {
      'source': option == 1 ? "ko" : "en", //위에서 언어 판별 함수에서 사용한 language 변수
      'target': option == 1 ? "en" : "ko", //원하는 언어를 선택할 수 있다.
      'text': prompt,
    },
  );
  if (trans.statusCode == 200) {
    var dataJson = jsonDecode(trans.body);
    var resultPapago = dataJson['message']['result']['translatedText'];
    print(resultPapago);
    return resultPapago;
  } else {
    print(trans.statusCode);
    return "fail to get papago result. trans.statusCode : ${trans.statusCode}";
  }
}
