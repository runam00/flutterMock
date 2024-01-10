import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'ResultListPage.dart';

class ResultPage extends StatelessWidget{

  ResultPage(this.sweetsType);
  dynamic sweetsType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("診断結果")
      ),
      body : Center(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // テキスト「あなたのお菓子タイプは…」
                Container(
                  padding: EdgeInsets.only(right: 200),
                  child: Text("あなたのお菓子タイプは…", style: TextStyle(fontSize: 24),),
                ),

                // お菓子タイプの名前
                Container(
                  margin: EdgeInsets.only(top: 24, bottom: 30),
                  child: Text(
                    sweetsType['name'],
                    style: TextStyle(fontSize: 42),)
                ),

                // お菓子タイプの画像
                Container(
                  width: 300,
                  child: Image.asset(
                    sweetsType['path'],
                    fit: BoxFit.fitWidth,
                    )
                ),

                //お菓子タイプの説明
                Container(
                  width: 500,
                  margin: EdgeInsets.only(top: 24, bottom: 10),
                  child: Text(
                    sweetsType['detail'],
                    style: TextStyle(fontSize: 18),
                  ),
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
                      Navigator.push(
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
        )
      )
    );
  }
}