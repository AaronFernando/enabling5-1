import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  double h = 0.0, w = 0.0;
  String t = '';
  int m = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal[300],
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: const Text( 'Auto Size Text Package',
            style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: Column(
            children: [
              Container(
                width: 300,
                margin: EdgeInsets.all(5),
                child: const Text('Flutter widget that automatically resizes text to fit perfectly within its given boundaries.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter a sentence or a long text',
                  ),
                  onChanged: (userInput) {
                    t = (userInput);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter height size of the text box',
                  ),
                  onChanged: (userInput) {
                    h = double.parse(userInput);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter width size of the text box',
                  ),
                  onChanged: (userInput) {
                    w = double.parse(userInput);
                  },
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Enter max lines to limit the text',
                  ),
                  onChanged: (userInput) {
                    m = int.parse(userInput);
                  },
                ),
              ),
              Container(
                width: 300,
                margin: EdgeInsets.all(5),
                child: const Text('RESULT',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              FutureBuilder(
                future: Future.delayed(Duration(seconds: 30)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else {
                    return Container(
                      margin: EdgeInsets.all(10),
                        child: SizedBox(
                            width: w,
                            height: h,
                            child: AutoSizeText(
                              '$t',
                              style: TextStyle(fontSize: 30),
                              maxLines: m,
                            )
                        )
                    );
                  }
                },
              )
            ]
        ),
      ),
    );
  }
}
