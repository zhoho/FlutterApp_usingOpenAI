import 'package:flutter/material.dart';
import 'package:fun_ai/util.dart';

class ResultPage extends StatefulWidget {
  final String prompt;
  const ResultPage(this.prompt, {super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<String>(
          future: getAnswer(widget.prompt),
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
