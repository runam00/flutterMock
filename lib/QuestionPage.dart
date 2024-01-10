// import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'ResultPage.dart';
import 'dart:math';

class QuestionPage extends StatefulWidget{
  const QuestionPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}


class _QuestionPageState extends State<QuestionPage>{

  List<dynamic> sweetsTypes = [];
  List<dynamic> questions = [];
  int _value = 1;

  @override
  void initState() {
    super.initState();
    loadJsonSweetsTypes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("質問")
      ),
      body : Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 質問
            FutureBuilder(
              future: loadJsonQuestions(),
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<dynamic> questions = snapshot.data;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        for (final question in questions)
                        Container(
                          margin: EdgeInsets.only(top: 20, bottom: 20),
                          child: Column(children: [
                            Text(question['question'], style: TextStyle(fontSize: 18)),
                            Container(height: 10),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 1,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                    _value = value!;
                                    });
                                  },
                                ),
                                Text(question['a']),
                              ],
                            ),
                            Container(height: 5),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                  value: 2,
                                  groupValue: _value,
                                  onChanged: (value) {
                                    setState(() {
                                    _value = value!;
                                    });
                                  },
                                ),
                                Text(question['b']),
                              ],
                            ),
                          ]),
                        )
                      ],
                    );
                  } else {
                    String data = "エラー";
                    return Text(data);
                  }
                } else if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else {
                  String data = "エラー";
                  return Text(data);
                }
              }
            ),

            // 結果を表示するボタン
            Container(
              margin: EdgeInsets.only(top: 24),
              child: ElevatedButton(
                child: Text("結果を表示"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                ),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(getRandomSweetsType()),
                    )
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }

  Future<void> loadJsonSweetsTypes() async {
    String loadDataSweetsTypes = await rootBundle.loadString('sweets_types.json');
    sweetsTypes = jsonDecode(loadDataSweetsTypes);
  }

  Future<List<dynamic>> loadJsonQuestions() async {
    String loadDataQuestions = await rootBundle.loadString('questions.json');
      questions = jsonDecode(loadDataQuestions);
      return questions;
  }

  dynamic getRandomSweetsType(){
    var random = new Random();
    return sweetsTypes[random.nextInt(sweetsTypes.length)];
  }
}