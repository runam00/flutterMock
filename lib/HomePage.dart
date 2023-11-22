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
        child: ElevatedButton(
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
              builder: (context) => QuestionPage()
            ));
          },
        ),
      )
    );
  }
}