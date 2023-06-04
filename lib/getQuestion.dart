import 'package:flutter/material.dart';
import 'package:fun_ai/getResult.dart';
import 'package:fun_ai/main.dart';

class GetQuestion extends StatefulWidget {
  const GetQuestion({Key? key}) : super(key: key);

  @override
  _GetQuestionState createState() => _GetQuestionState();
}

class _GetQuestionState extends State<GetQuestion> {
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _partnerController = TextEditingController();
  final TextEditingController _budgetController = TextEditingController();

  bool _natureStyleSelected = false;
  bool _busyStyleSelected = false;
  bool _funStyleSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Planner'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              controller: _partnerController,
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
              "여행 동반자",
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
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                String country = _countryController.text;
                String duration = _durationController.text;
                String partner = _partnerController.text;
                String budget = _budgetController.text;
                String travelStyle = "with lover";
                String dayOrHour = _natureStyleSelected
                    ? '자연 / '
                    : _busyStyleSelected
                        ? '바쁘게 / '
                        : _funStyleSelected
                            ? '재밌게 '
                            : '';
                String acommodationContent = "";
                String acommodation =
                    "and recommend accommodation for each day of the week.";
                String prompt =
                    "I'm going on a trip. You are my tour guide. The travel period I want to go is a total of $duration days. I want to go to $country. The following are the considerations. 1. I personally like $travelStyle 2. I will travel $partner 3. My budget is $budget Based on this, answer the following questions. Please recommend a schedule for each Day or Hour, indicate the cost of each activity, $acommodation (Travel plans should be formulated in accordance with the budget as much as possible and should not exceed the budget.";
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
    );
  }
}
