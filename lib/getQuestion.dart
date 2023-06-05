import 'package:flutter/material.dart';
import 'package:fun_ai/getResult.dart';

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

  bool _activityStyleSelected = false;
  bool _shoppingStyleSelected = false;
  bool _foodStyleSelected = false;
  bool _famousStyleSelected = false;

  bool _partnerSelected = false;
  bool _childSelected = false;
  bool _familySelected = false;
  bool _aloneSelected = false;

  bool _isDaySelected = true;
  bool _ishotelSelected = true;

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
                  hintText: '예) 3 숫자만 입력',
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
                  hintText: '예) 2 숫자만 입력',
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
                  hintText: '예) 1000000, 숫자만 입력',
                ),
              ),
              const Text(
                "여행 스타일",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _activityStyleSelected,
                        onChanged: (value) {
                          setState(() {
                            _activityStyleSelected = value ?? false;
                            if (_activityStyleSelected) {
                              _shoppingStyleSelected = false;
                              _foodStyleSelected = false;
                              _famousStyleSelected = false;
                            }
                          });
                        },
                      ),
                      const Text('체험(엑티비티)'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _shoppingStyleSelected,
                        onChanged: (value) {
                          setState(() {
                            _shoppingStyleSelected = value ?? false;
                            if (_shoppingStyleSelected) {
                              _activityStyleSelected = false;
                              _foodStyleSelected = false;
                              _famousStyleSelected = false;
                            }
                          });
                        },
                      ),
                      const Text('쇼핑'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _foodStyleSelected,
                        onChanged: (value) {
                          setState(() {
                            _foodStyleSelected = value ?? false;
                            if (_foodStyleSelected) {
                              _activityStyleSelected = false;
                              _shoppingStyleSelected = false;
                              _famousStyleSelected = false;
                            }
                          });
                        },
                      ),
                      const Text('음식'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: _famousStyleSelected,
                        onChanged: (value) {
                          setState(() {
                            _famousStyleSelected = value ?? false;
                            if (_famousStyleSelected) {
                              _foodStyleSelected = false;
                              _activityStyleSelected = false;
                              _shoppingStyleSelected = false;
                            }
                          });
                        },
                      ),
                      const Text('유명관광지'),
                    ],
                  ),
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
              const Text(
                "숙소도 추천해드릴까요?",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: _ishotelSelected,
                        onChanged: (value) {
                          setState(() {
                            _ishotelSelected = value as bool;
                          });
                        },
                      ),
                      const Text('숙소 포함'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: _ishotelSelected,
                        onChanged: (value) {
                          setState(() {
                            _ishotelSelected = value as bool;
                          });
                        },
                      ),
                      const Text('숙소 미포함'),
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
                  String travelStyle = _activityStyleSelected
                      ? '체험 엑티비티 위주'
                      : _shoppingStyleSelected
                          ? '쇼핑 위주'
                          : _foodStyleSelected
                              ? '맛집 음식 위주'
                              : _famousStyleSelected
                                  ? '유명관광지 위주'
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
                  String isDaySelected =
                      _isDaySelected ? "on a daily" : "on a time";

                  String acommodation = _ishotelSelected
                      ? 'Please recommend the accommodation according to the price'
                      : '';
                  String prompt =
                      "I'm going on a trip. You are my tour guide. The travel period I want to go is a total of $duration days. And I total meber is $people I want to go to $country. The following are the considerations. 1. I personally like $travelStyle 2. I will travel $partner 3. My budget is $budget won Based on this, answer the following questions. Please recommend a schedule for each $isDaySelected, indicate the cost of each activity, $acommodation (Travel plans should be formulated in accordance with the budget as much as possible should not exceed the budget) 그리고 이 답변을 여행계획표 처럼 잘 정리해서 중복 답변 없이 한글로 보여줘 ";
                  print(prompt);
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
