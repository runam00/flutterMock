import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'ResultPage.dart';
import 'dart:math';

class QuestionPage extends StatelessWidget{

  List<dynamic> sweetsTypes = [];

  QuestionPage(){
    initialize();
  }

  Future<void> initialize() async {
    await loadJsonAsset();
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

            Container(
            ),

            // 結果を表示するボタン
            Container(
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

  Future<void> loadJsonAsset() async {
    String loadData = await rootBundle.loadString('sweets_types.json');
    sweetsTypes = jsonDecode(loadData);
  }

  dynamic getRandomSweetsType(){
    var random = new Random();
    return sweetsTypes[random.nextInt(sweetsTypes.length)];
  }
}