import 'package:deutsch_app/quiz.dart';
import 'package:flutter/material.dart';


class Kapitel extends StatelessWidget {
  final List<Map<String,dynamic>> quizDart;

  const Kapitel({super.key, required this.quizDart});





  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Kapitel"),
      ),
      body: Center(
        child: Column(
          children: [
            for(var chapter in quizDart)
              buildElevatedButton(context, chapter['chapter'])
          ],
        ),
      ),
    );

  }

  Widget buildElevatedButton(BuildContext context,String kapitelName) {
    return ElevatedButton(
          onPressed: (){
            List<Map<String, dynamic>> kapitel1Questions = [];
            for (var chapter in quizDart) {
              if (chapter['chapter'] == kapitelName) {
                 kapitel1Questions = chapter['questions'];
                break;
              }
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IndefiniteArticleGame(kapitelNouns: kapitel1Questions)),
            );
          },
          child:  Text(kapitelName));
  }


}
