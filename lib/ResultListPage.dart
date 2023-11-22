import 'package:flutter/material.dart';

class ResultListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text("お菓子タイプ一覧")
      ),
      body : Center(
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
            Navigator.popUntil(context, (route) => route.isFirst);
          },
        ),
      )
    );
  }
}