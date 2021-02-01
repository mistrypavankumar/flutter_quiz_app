import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/controller/question_controller.dart';
import 'package:flutter_quiz_app/screens/quiz/componets/options.dart';
import 'package:get/get.dart';
import 'package:flutter_quiz_app/constants/constants.dart';
import 'package:flutter_quiz_app/models/Questions.dart';

class QuestionCard extends StatelessWidget {
  final Question question;

  const QuestionCard({
    Key key,
    @required this.question,
    }):super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: mgDefaultPadding),
      padding: const EdgeInsets.all(mgDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(23),
        ),
      ),
      child: Column(
        children: [
          Text(
            question.question,
            style: Theme.of(context).textTheme.headline6.copyWith(
                  color: mgBlackColor,
                ),
          ),
          SizedBox(height: mgDefaultPadding / 2),
           ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAns(question, index),
            ),
          ),
        ],
      ),
    );
  }
}
