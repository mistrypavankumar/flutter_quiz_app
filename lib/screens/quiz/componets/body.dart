import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screens/quiz/componets/question_card.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz_app/constants/constants.dart';
import 'package:flutter_quiz_app/controller/question_controller.dart';

import 'progressBar.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,

  }):super(key: key);


  @override
  Widget build(BuildContext context) {
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: mgDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(
                height: mgDefaultPadding,
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: mgDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Question ${_questionController.questionNumber.value}",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: mgSecondaryColor),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: mgSecondaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: mgDefaultPadding),
              Expanded(
                child: PageView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    controller: _questionController.pageController,
                    onPageChanged: _questionController.updateTheQnNum,
                    itemCount: _questionController.questions.length,
                    itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index],
                      ),
                    ),
                ),
            ],
          ),
        ),
      ]
    );
            
  }
}