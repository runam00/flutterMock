import 'package:flutter/material.dart';
import 'ResultPage.dart';

class QuestionPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("質問")
      ),
      body : Center(
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
                builder: (context) => ResultPage(),
              ));
          },
        ),
      )
    );
  }
}