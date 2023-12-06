import 'package:flutter/material.dart';
import 'ResultPage.dart';
import 'dart:math';

class QuestionPage extends StatelessWidget{
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(generateRandomImageItem()),
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

  // 画像のパスをランダムに返す
  Map<String, String> generateRandomImageItem(){
    List<Map<String, String>> image_paths = [
      {'ポテトチップス': 'images/potatochips.png'},
      {'キャンディ': 'images/sweets_candy.png'},
      {'クラッカー': 'images/sweets_cracker.png'},
      {'グミ': 'images/sweets_gumi.png'},
      {'カキピー': 'images/sweets_kakipi.png'},
      {'チョコレート': 'images/valentine_chocolates.png'},
    ];
    var random = new Random();
    return image_paths[random.nextInt(image_paths.length)];
  }
}