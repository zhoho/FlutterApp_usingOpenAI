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
                      "I'm going on a trip. You are my tour guide. The travel period I want to go is a total of $duration days. I want to go to $country. The following are the considerations. 1. I personally like $travelStyle 2. I will travel $partner 3. My budget is $budget won Based on this, answer the following questions. Please recommend a schedule for each $_isDaySelected, indicate the cost of each activity, Acommodation (Travel plans should be formulated in accordance with the budget as much as possible and should not exceed the budget.";
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
