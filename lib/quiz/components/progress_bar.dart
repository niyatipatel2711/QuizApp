import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constraints.dart';
import 'package:quiz_app/controllers/question_controller.dart';

class ProgressBar extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 35,
      //color: Colors.white,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFF3F4768), width: 3),
          borderRadius: BorderRadius.circular(50)
      ),
      child: GetBuilder<QueController>(
        init: QueController(),
        builder: (controller) {
          //print(controller.animation.value);
          return Stack(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Container(
                  width: constraints.maxWidth * controller.animation.value,
                  decoration: BoxDecoration(
                    gradient: kPrimaryGradient,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              Positioned.fill(
                  child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${(controller.animation.value * 60).round()} sec"),
                    Image.asset('assets/images/clock.png'),
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
