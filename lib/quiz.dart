import 'dart:math';
import 'package:deutsch_app/MainPage.dart';
import 'package:flutter/material.dart';



 class IndefiniteArticleGame extends StatefulWidget {
   const IndefiniteArticleGame({Key? key, required this.kapitelNouns}) : super(key: key) ;

   final List<Map<String,dynamic>> kapitelNouns;


  @override
   IndefiniteArticleGameState createState() => IndefiniteArticleGameState();
}

class IndefiniteArticleGameState extends State<IndefiniteArticleGame> {
  List<Map<String, dynamic>> displayedNouns = [];
  List<Map<String, dynamic>> incorrectAnswers = [];

  int currentIndex = 0;
  int score = 0;
  Random random = Random();
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Indefinite Article Game"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: widget.kapitelNouns.isNotEmpty ?
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.kapitelNouns[currentIndex]["word"]!,
              style: const TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildOptionButton("der"),
                buildOptionButton("die"),
                buildOptionButton("das"),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              "Score: $score",
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        )
            :
        Center(
            child: Column(
              children: [
                Text(
                    "Your score is $score / 18"
                ),
                buildElevatedButton(context)
              ],
            )
        ),

      ),
    );
  }

  ElevatedButton buildElevatedButton(BuildContext context) {
    return incorrectAnswers.isNotEmpty ?
    ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  // NEW
                ),
                child: const Text(
                  "Repeat the wrong ones",
                  style: TextStyle(fontSize: 20.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>   IndefiniteArticleGame(kapitelNouns: incorrectAnswers, )),
                  );
                },
              ) :
    ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          // NEW
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>   const MainPage()),
          );
        },
        child: const Text("return to main Page")
    );
  }

  Widget buildOptionButton(String article) {
    return Flexible(
      flex: 1,
      child: Builder(
        builder: (context) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              // NEW
            ),
            child: Text(
              article,
              style: const TextStyle(fontSize: 20.0),
            ),
            onPressed: () => checkAnswer(article,context),
          );
        }
      ),
    );
  }

  void checkAnswer(String selectedArticle,BuildContext context) {
    if (selectedArticle == widget.kapitelNouns[currentIndex]["article"]) {
      setState(() {
        isTrue = true;
        score++;
        displayedNouns.add(widget.kapitelNouns[currentIndex]);
        print(widget.kapitelNouns);
      });
    } else {
      setState(() {
        isTrue = false;
        incorrectAnswers.add(widget.kapitelNouns[currentIndex]);

      });
    }
    Scaffold.of(context).showBottomSheet<void>(
          (BuildContext context) {
        return Builder(
          builder: (context) {
            return Container(
              height: 100,
              color:  isTrue ? Colors.green : Colors.red,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(widget.kapitelNouns[currentIndex]["article"] + widget.kapitelNouns[currentIndex]["word"]),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: isTrue ? Colors.lightGreen : Colors.redAccent,
                        // NEW
                      ),
                      child: const Text('Next'),
                      onPressed: ()  {
                        Navigator.pop(context);
                        setState(() {
                          widget.kapitelNouns.removeAt(currentIndex);
                          if (widget.kapitelNouns.isNotEmpty) {
                            currentIndex = random.nextInt(widget.kapitelNouns.length);
                          }
                        });

                      },
                    ),
                  ],
                ),
              ),
            );
          }
        );
      },
    );


  }
}
