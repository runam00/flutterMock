import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ResultListPage.dart';

class ResultPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("診断結果")
      ),
      // テキスト「あなたのお菓子タイプは…」
      body : Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 70),
              padding: EdgeInsets.only(right: 200),
              child: Text("あなたのお菓子タイプは…", style: TextStyle(fontSize: 24),),
            ),

            // お菓子タイプ一覧ページに遷移するボタン
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              child: ElevatedButton(
                child: Text("他のお菓子タイプを見る"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => ResultListPage(),
                    )
                  );
                },
              ),
            ),
            
            // スタートに戻るボタン
            Container(
              child: ElevatedButton(
                child: Text("スタートに戻る"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: (){
                  Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
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
}