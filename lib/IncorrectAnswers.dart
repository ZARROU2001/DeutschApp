import 'package:flutter/material.dart';

class IncorrectAnswers extends StatefulWidget {
  IncorrectAnswers({Key? key,required List<Map<String, String>> IncorrectAnswer}) : super(key: key);
  @override
  State<IncorrectAnswers> createState() => _IncorrectAnswersState();
}

class _IncorrectAnswersState extends State<IncorrectAnswers> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
