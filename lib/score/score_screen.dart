import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:quiz_app/constraints.dart';
import 'package:quiz_app/controllers/question_controller.dart';

import '../welcome_screen.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future<bool> _onBackPressed() {
      return showDialog(
          context: context,
          builder: (context) => AlertDialog(
                  title: Text('Are you sure want to retake the quiz?'),
                  actions: <Widget>[
                    ElevatedButton(
                      child: Text('Yes'),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => WelcomeScreen())),
                    ),
                    ElevatedButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                    ),
                  ]));
    }

    QueController _qnController = Get.put(QueController());

    return WillPopScope(
      onWillPop: () => _onBackPressed(),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/bg.png',
                  ),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  Spacer(),
                  Container(
                    height: 400,
                    width: double.infinity,
                    child: Lottie.asset('assets/result.json'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Score : ",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: kSecondaryColor),
                      ),
                      Text(
                        "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(color: kSecondaryColor),
                      ),
                    ],
                  ),
                  Spacer(flex: 4,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
