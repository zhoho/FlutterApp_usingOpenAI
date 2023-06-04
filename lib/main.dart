import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

final openaikey = dotenv.env['openaiapiKey'];
const apiUrl = 'https://api.openai.com/v1/engines/text-davinci-003/completions';

void main() async {
  await dotenv.load(fileName: "lib/.env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const GetQuestion(),
    );
  }
}

// class GetQuestion extends StatefulWidget {
//   const GetQuestion({Key? key}) : super(key: key);

//   @override
//   _GetQuestionState createState() => _GetQuestionState();
// }

// class _GetQuestionState extends State<GetQuestion> {
//   final TextEditingController _countryController = TextEditingController();
//   final TextEditingController _durationController = TextEditingController();
//   final TextEditingController _peopleController = TextEditingController();
//   final TextEditingController _budgetController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         const Text("가고싶은 나라나 도시를 입력하세요"),
//         TextField(
//           controller: _countryController,
//           inputFormatters: <TextInputFormatter>[
//             FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]')),
//           ],
//         ),
//         const Text("여행기간선택"),
//         TextField(
//           controller: _durationController,
//           inputFormatters: <TextInputFormatter>[
//             FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]')),
//           ],
//         ),
//         const Text("인원수"),
//         TextField(
//           controller: _peopleController,
//           inputFormatters: <TextInputFormatter>[
//             FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]')),
//           ],
//         ),
//         const Text("예산"),
//         TextField(
//           controller: _budgetController,
//           inputFormatters: <TextInputFormatter>[
//             FilteringTextInputFormatter.allow(RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]')),
//           ],
//         ),
//         TextButton(
//           onPressed: () {
//             String prompt = '_controller.text';
//             Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => ResultPage(prompt)));
//           },
//           child: const Text("Get result"),
//         ),
//       ]),
//     );
//   }
// }

class GetQuestion extends StatefulWidget {
  const GetQuestion({Key? key}) : super(key: key);

  @override
  _GetQuestionState createState() => _GetQuestionState();
}

class _GetQuestionState extends State<GetQuestion> {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _peopleController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();

  bool _natureStyleSelected = false;
  bool _busyStyleSelected = false;
  bool _funStyleSelected = false;

  bool _partnerSelected = false;
  bool _childSelected = false;
  bool _familySelected = false;
  bool _aloneSelected = false;
  bool _isDaySelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Planner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text(
                "가고싶은 나라나 도시를 입력하세요",
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _countryController,
                inputFormatters: const [
                  // FilteringTextInputFormatter.allow(
                  //   RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]'),
                  // ),
                ],
                decoration: const InputDecoration(
                  hintText: '예) 일본, 파리',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "여행 기간 선택",
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _durationController,
                inputFormatters: const [
                  // FilteringTextInputFormatter.allow(
                  //   RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]'),
                  // ),
                ],
                decoration: const InputDecoration(
                  hintText: '예) 7일, 2주',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "인원 수",
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _peopleController,
                inputFormatters: const [
                  // FilteringTextInputFormatter.allow(
                  //   RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]'),
                  // ),
                ],
                decoration: const InputDecoration(
                  hintText: '예) 2명, 4인 가족',
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "예산",
                style: TextStyle(fontSize: 16),
              ),
              TextField(
                controller: _budgetController,
                inputFormatters: const [
                  // FilteringTextInputFormatter.allow(
                  //   RegExp(r'[ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ]'),
                  // ),
                ],
                decoration: const InputDecoration(
                  hintText: '예) 100만원',
                ),
              ),
              const Text(
                "여행 스타일",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  Checkbox(
                    value: _natureStyleSelected,
                    onChanged: (value) {
                      setState(() {
                        _natureStyleSelected = value ?? false;
                        if (_natureStyleSelected) {
                          _busyStyleSelected = false;
                          _funStyleSelected = false;
                        }
                      });
                    },
                  ),
                  const Text('자연'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _busyStyleSelected,
                    onChanged: (value) {
                      setState(() {
                        _busyStyleSelected = value ?? false;
                        if (_busyStyleSelected) {
                          _natureStyleSelected = false;
                          _funStyleSelected = false;
                        }
                      });
                    },
                  ),
                  const Text('바쁘게'),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    value: _funStyleSelected,
                    onChanged: (value) {
                      setState(() {
                        _funStyleSelected = value ?? false;
                        if (_funStyleSelected) {
                          _natureStyleSelected = false;
                          _busyStyleSelected = false;
                        }
                      });
                    },
                  ),
                  const Text('재밌게'),
                ],
              ),
              const Text(
                "동행자 선택",
                style: TextStyle(fontSize: 16),
              ),
              CheckboxListTile(
                title: const Text('연인'),
                value: _partnerSelected,
                onChanged: (bool? value) {
                  setState(() {
                    _partnerSelected = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('자녀'),
                value: _childSelected,
                onChanged: (bool? value) {
                  setState(() {
                    _childSelected = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('가족'),
                value: _familySelected,
                onChanged: (bool? value) {
                  setState(() {
                    _familySelected = value!;
                  });
                },
              ),
              CheckboxListTile(
                title: const Text('혼자'),
                value: _aloneSelected,
                onChanged: (bool? value) {
                  setState(() {
                    _aloneSelected = value!;
                  });
                },
              ),
              const Text(
                "일/시간 선택",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: _isDaySelected,
                        onChanged: (value) {
                          setState(() {
                            _isDaySelected = value as bool;
                          });
                        },
                      ),
                      const Text('일'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: _isDaySelected,
                        onChanged: (value) {
                          setState(() {
                            _isDaySelected = value as bool;
                          });
                        },
                      ),
                      const Text('시간'),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  String country = _countryController.text;
                  String duration = _durationController.text;
                  String people = _peopleController.text;
                  String budget = _budgetController.text;
                  String travelStyle = _natureStyleSelected
                      ? '자연'
                      : _busyStyleSelected
                          ? '바쁘게'
                          : _funStyleSelected
                              ? '재밌게'
                              : '';
                  String partner = _partnerSelected
                      ? '연인과'
                      : _childSelected
                          ? '아이와'
                          : _familySelected
                              ? '가족과'
                              : _aloneSelected
                                  ? '혼자'
                                  : '';
                  String prompt =
                      "I'm going on a trip. You are my tour guide. The travel period I want to go is a total of $duration days. I want to go to $country. The following are the considerations. 1. I personally like $travelStyle 2. I will travel $partner 3. My budget is $budget Based on this, answer the following questions. Please recommend a schedule for each $_isDaySelected, indicate the cost of each activity, Acommodation (Travel plans should be formulated in accordance with the budget as much as possible and should not exceed the budget.";
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ResultPage(prompt),
                    ),
                  );
                },
                child: const Text("Get result"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultPage extends StatefulWidget {
  final String prompt;
  const ResultPage(this.prompt, {super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

Future<String> generateText(String prompt) async {
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

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: generateText(widget.prompt),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Text(
                'Erroddr: ${snapshot.error}',
                style: const TextStyle(color: Colors.black),
              );
            } else {
              return SingleChildScrollView(
                child: Text(
                  '${snapshot.data}',
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

// Future<void> getLanguage_papago() async {
//   String clientId = "XmTlLucY96Uw2pp4rj8q";
//   String clientSecret = "9r2hYCiRF5";
//   String contentType = "application/x-www-form-urlencoded; charset=UTF-8";
//   String url = "https://openapi.naver.com/v1/papago/detectLangs";

//   http.Response lan = await http.post(Uri.parse(url), headers: {
//     // 'query': text,
//     'Content-Type': contentType,
//     'X-Naver-Client-Id': clientId,
//     'X-Naver-Client-Secret': clientSecret
//   }, body: {
//     'query': prompt
//   });
//   if (lan.statusCode == 200) {
//     var dataJson = jsonDecode(lan.body);
//     //만약 성공적으로 언어를 받아왔다면 language 변수에 언어가 저장됩니다. (ex: eu, ko, etc..)
//     var language = dataJson['langCode'];
//   } else {
//     print(lan.statusCode);
//   }
// }

// Future<void> getTranslation_papago() async {
//   String clientId = "XmTlLucY96Uw2pp4rj8q";
//   String clientSecret = "9r2hYCiRF5";
//   String contentType = "application/x-www-form-urlencoded; charset=UTF-8";
//   String url = "https://openapi.naver.com/v1/papago/n2mt";
//   await getLanguage_papago();

//   http.Response trans = await http.post(
//     Uri.parse(url),
//     headers: {
//       'Content-Type': contentType,
//       'X-Naver-Client-Id': clientId,
//       'X-Naver-Client-Secret': clientSecret
//     },
//     body: {
//       'source': language, //위에서 언어 판별 함수에서 사용한 language 변수
//       'target': "en", //원하는 언어를 선택할 수 있다.
//       'text': "번역할 내용",
//     },
//   );
//   if (trans.statusCode == 200) {
//     var dataJson = jsonDecode(trans.body);
//     var resultPapago = dataJson['message']['result']['translatedText'];
//   } else {
//     print(trans.statusCode);
//   }
// }
