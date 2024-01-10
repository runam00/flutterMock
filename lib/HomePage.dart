import 'package:flutter/material.dart';
import 'QuestionPage.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("スタート画面")
      ),
      body : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // タイトル
            Container(
              margin: EdgeInsets.all(30),
              child: Text(
                "お菓子タイプ性格診断",
                style: TextStyle(fontSize: 30),
                ),
            ),
            ElevatedButton(
              child: Text("スタート"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => QuestionPage(title: '質問')
                  )
                );
              },
            ),
          ],
        )
      )
    );
  }
}