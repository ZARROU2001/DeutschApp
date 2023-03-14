import 'package:flutter/material.dart';
import 'package:deutsch_app/assets/Colors.dart';
import 'Kapitel.dart';
import 'Data.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("QuizApp",style: TextStyle(color: Colors.black),),
        backgroundColor: Color.principal,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>   Kapitel(quizDart: Data.quizData,)),
              );
              }, child: const Text("A1"))
          ],
        ),
      ),
    );
  }
}


