import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constraints.dart';
import 'package:quiz_app/models/Questions.dart';
import './option.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QueController _controller = Get.put(QueController());

    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: [
            Text(
              question.question,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: kBlackColor),
            ),
            SizedBox(
              height: kDefaultPadding / 2,
            ),
            ...List.generate(
              question.options.length,
              (index) => Option(
                index: index,
                text: question.options[index],
                press: () => _controller.checkAns(question, index),
              ),
            )
          ],
        ),
      ),
    );
  }
}
