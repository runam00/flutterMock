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
      body : Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
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
                  ));
            },),
          SizedBox(height: 50),
          ElevatedButton(
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
                  ));
            },),
          ],
        ),
      )
    );
  }
}