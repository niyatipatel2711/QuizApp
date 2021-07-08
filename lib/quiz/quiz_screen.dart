import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:quiz_app/welcome_screen.dart';
import 'components/body.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Future<bool> _onBackPressed(){
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Are you sure want to exit from the quiz?'),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Yes'),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen())),
          ),
          ElevatedButton(
            child: Text('No'),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ]
      )
    );
  } 

    QueController _controller = Get.put(QueController());

    return WillPopScope(
      onWillPop: () => _onBackPressed(),
          child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: _controller.nextQuestion, 
              child: Text('Skip', style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
        body: Body()
      ),
    );
  }
}